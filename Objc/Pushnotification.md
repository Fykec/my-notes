parent nodes: [ObjC](ObjC.html)\
\

Pushnotification {.heading-level2}
----------------

Generate APNS SSL Certificate\
 To get started with APNS we need to generate an certificate unique to
each applications which will support APNS. We need to log into our
iPhone developer portal with “Team Agent” access. Only users with “Team
Agent” access can do the below mentioned process. The iPhone developer
portal with “Team Agent ” has a detailed steps to generate an APNS
certificate. You should be able to see the screen shown below in the
portal to start creating your APNS certificate. Follow the steps
mentioned below:-\
 Fig 1: APNS Development Certificate\
 \
 (1) You need to create an App ID without .\* in the iPhone developer
Portal. An App ID without .\* means its unique and works only for a
single application\
 \
 (2) Generate a certificate signing request from your Mac’s keychain
(You should be an Team Agent to have access to the wizard shown in
Figure 1) as shown in figure 2 and save to disk\
 \
 (3) Upload the CertificateSigningRequest.certSigningRequest to the
Program Portal\
 \
 (4) Wait for the generation of cert (about 1 min). Download the
certificate (aps\_developer\_identity.cer) from the Program Portal\
 \
 (5) Keep (or rename them if you want) these 2 files (steps 2 and 4) in
a safe place. You might need the
CertificateSigningRequest.certSigningRequest file to request a
production cert in the future or renew it again.\
 \
 (6) Suppose you have imported the aps\_developer\_identity.cer to the
keychain. Then you have to export these new cert and the private key of
this cert (not the public key) and saved as .p12 files.\
 \
 (7) Then you use these commands to generate the cert and key in Mac’s
Terminal for PEM format (Privacy Enhanced Mail Security Certificate)\
 openssl pkcs12 -clcerts -nokeys -out cert.pem -in cert.p12\
 openssl pkcs12 -nocerts -out key.pem -in key.p12\
 \
 (8) The cert.pem and key.pem files will be used by your own program
communicating with APNS.\
 \
 (9) If you want to remove the passphase of private key in key.pem, do
this\
 openssl rsa -in key.pem -out key.unencrypted.pem\
 \
 Then combine the certificate and key\
 cat cert.pem key.unencrypted.pem \> ck.pem\
 \
 But please set the file permission of this unencrypted key by using
chmod 400 and is only readable by root in a sever configuration.
