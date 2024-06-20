/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {onRequest} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import * as sgMail from '@sendgrid/mail';

admin.initializeApp();

const SENDGRID_API_KEY = 'your_sendgrid_api_key';
const RECIPIENT_EMAIL = 'recipient_email@example.com';

sgMail.setApiKey(SENDGRID_API_KEY);

exports.sendEmail = functions.firestore
    .document('purchases/{purchaseId}')
    .onCreate(async (snap, context) => {
        const purchase = snap.data();

        const msg = {
            to: RECIPIENT_EMAIL,
            from: 'your_verified_sendgrid_email@example.com',
            subject: 'New Art Purchase',
            text: `Art purchased: ${purchase.artName} by ${purchase.author}`,
            html: `<strong>Art purchased: ${purchase.artName} by ${purchase.author}</strong>`,
        };

        try {
            await sgMail.send(msg);
            console.log('Email sent');
        } catch (error) {
            console.error(`Error sending email: ${error}`);
        }
    });


// Start writing functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
