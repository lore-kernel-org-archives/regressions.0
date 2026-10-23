Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715941;
	b=Illldcq8f0o84g/hDTc4AxzILzNSYFXrbpjLdd6oE0uVjz2G1wFSd3Kv6Kck6nuyTypw
	 CAR6UuB/PG5gFDZuCJnaDTs4hexcML8MRNHmp+3nuC0JGXXVQeYArXT6234IZ0jodsE5z
	 kD3OF1oLBfn46ECM3ecNwEKcFrdw3YKy0kFvnjbtympnU9/HpYYfTNFIhEVD2SlqZoXtA
	 qCdeyJfDPPVm/chxIIChO1F/mYHcsYKaeaX/xlVIFzT9uwAwxNXVtdyw/X9Zbuwh80P1J
	 Sa3d4+vk/2mVeyweLs+WTaXjWujijl8Oj1T7ws0yW1YFY0NvwgGQoAd9bCCLSMX+6rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
	b=F2BlRhTsTlLj/QUChuU9xD4BseHbdMw0969+dqJLlgEngnAwG5/Ga6a8hcsqgYN38aBb
	 8jaqDNl7QBwFIW1yNUaab0KUUkprybQTk0xSHWBMjxvHbL0KcGc+hoPuhwsQmtmjOpvQ8
	 Wi8dGgKDpmSjW+O7DyfvI+6uLrtv3JqEDyr14xLXKm80qjcpal8m6d4N1RspyQjiYP+9s
	 AjmN4R2PImo4w0Zx6c7cFsEuMEPHCH9UraKtvW8Ieh1+0sfdjjp7MoOi6BZGu43Z4GROF
	 t4PokImkHw0uGiGm5R330Wh5C+DnbE1OtdkGt9LjFDFW3NdKiw4MJ0F/Zno9I5dboqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FpFB2UEs;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26518606A31A
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 00:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26518606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FpFB2UEs
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c37b612635bso48616066b.3
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 17:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792715939; x=1793320739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
        b=FpFB2UEsFYf5S955iRbIS8ZKjHMvG8Jt+p2+5o6CI1v4jwxnbMcmr1VrUdR0z35VND
         5hB4m4yhsfZXZw/sSBzyOV0EPfDIpKBuoNSMfQ7lNZL1hmOxyu+9+Vg3y488Pg9QzHZV
         r+CzSXu/pMGh6LLwjZCNN1CX6uv+k4EqyaXgxGMuiRwgpz5r2shhhld01YSfpUFGaaud
         y859ZPFzaBeoOmW532TOILj0LCJTglt/0LcvoYrem8VEjyDVcJjGWikKdUYFX0bhTrfx
         C3PizK2qJx3siDDRIm2JYuvSY6cR4xdXJTtIV6V+lMtulrcvIVi2pDdqcTSfmAW/akCJ
         OPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715939; x=1793320739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
        b=GhRyD/CduQtewR8NVeYlrPd2v0kE4c5/1C4w+oAPTnxHZcxt4QPl4RA3+jjR/RB+Sw
         n0YgDKwZTbmv/jc8rA2B2XXQCU13RXHIRPFcaY9kexLDhR+/w5Hae/EQTqryC2bUc6AE
         hO7a7DlaBKY1Nr3ja7V93fLxKDDILlBL0ivs2GbmYfhmTWekQBWwnP1SiOf81ve+96l8
         RBWUyurFZty1fECOGM7xIEcnOjLtOnjAlqL/B9pmHRHDH7D4ejrb2SrjY4ctAB5fQS8G
         quNQMIfA5VZjWEAPrKCcbSp2vqzohnrL9crgJwCe65SEb9l9R+CxvnnId/8YzJyxs1np
         tlgw==
X-Forwarded-Encrypted: i=1; AKwUvBy9IEcMPJhs9xQM34ux0oMIrhSf5DFrVC8WnALHl1sq/GtVcPa+kcgF2MmNOoOYVWR1pPgvUsv1WJ3dhw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKFpSDcK8Z90nWxr9YvbHesgjiClz36IstLqG2HZ6nOxk/4lz2i
	mLDSimuxwnSpmU7ISYmhAbwFtVqDErMX7eeo5D0CV74Cjls4OGicm0p6
X-Gm-Gg: AYBFou1E8ZPX7+lq/2OtpJ4hEGg2WGoph24LVnMTxx9DqXQSvWSCOGPcdazxWW71h+7
	hSYeD/NvgVUqY14KicahUJ4/GenwrDP/sILYNIKLuRJwWzPPKiM/nOpXcyrydFIjcmsrW15HcOY
	l1ZJmVY0i+Q52GlxrDJOzzP6BHsSKe2bbMwEEFcKb5+chluuaVWqLPEkVkQKTJbE+kU7XrPI+9i
	2lzwIgNI3uSXiqC/biYRsT8QFL7GvjqaBx7KqAvEQ5vAQtKKHRMScGfdJETfSSU5B8hZz8GBdS8
	tiplyxcFiT18yyAqryS8i+aPwTsNiIXsaVctZ5iajjD3xcCSqZUhMNu5iyHOVzUpIFs+r8bCEdr
	PTM9YAfhSHrO7hgFH9rcF/JO6D1+BYBbNOo9wsEl1G0l6apF9XmLga9G328gA7LzaK5q+dC4/P2
	DvKe7PBJfSy7niJSby+Z4S3F2/eQwAZqwADSbjXGT1S4HvjG5pEUGoXQI7J0LJNLLRunKauM4cc
	fAqFYlhDwngsiBJISj9ZhfEZV07Tqfc+LOIbIJCIrOh+3+DyE85WdAxjfkjKx/ASZEyzL2L8Oj1
	QXEjhYk/wE/rF/wLs5fzxOc6QbRkm7k4w16WD/e3
X-Received: by 2002:a17:907:7b8f:b0:c41:e0c0:e6b7 with SMTP id a640c23a62f3a-c46a8f502d3mr128704266b.12.1792715939268;
        Thu, 22 Oct 2026 17:38:59 -0700 (PDT)
Received: from localhost.localdomain ([45.93.75.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5d17e95sm45499066b.83.2026.10.22.17.38.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 17:38:58 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
Date: Fri, 23 Oct 2026 02:38:55 +0200
Message-ID: <20261023003855.98316-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets
expire") added a __u64 session_expiry field to struct
ksmbd_spnego_authen_response, growing it from 156 to 168 bytes.
ipc_validate_msg() requires the response to have exactly that size, so
the 156-byte response of every released ksmbd-tools, up to 3.5.7, is
dropped and Kerberos session setup fails with STATUS_LOGON_FAILURE.
The other way round, kernels without that commit, including the stable
trees, drop the 168-byte response of current ksmbd-tools master, and
ksmbd-tools has no way to tell which layout a kernel expects.

Pass the expiry in the reserved area of the embedded struct
ksmbd_login_response instead. ksmbd-tools releases with that area
(3.4.4 and later) allocate the response zeroed and never write to it,
so they send an expiry of 0, which ksmbd already treats as no expiry.
The response is 156 bytes again, so it works with those releases, and
every kernel also accepts a response that sets the expiry. Use two
__u32 halves, as the reserved area is only 4-byte aligned.

Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets expire")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/all/CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8xCgtA42XUkSsAeg@mail.gmail.com/
Assisted-by: LLM
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
The matching ksmbd-tools change (struct layout and mountd/worker.c)
will follow as a pull request.

Tested with a local MIT KDC and smbclient --use-kerberos=required:

                    3.5.7      master     master + tools change
  7.2               login OK   fails      login OK
  7.3               fails      login OK   fails
  7.3 + this patch  login OK   fails      login OK

With this patch and the tools change, smbtorture smb2.session over
Kerberos (including expire1n/1s/1e, expire2s/2e and expire_disconnect)
and the 190 smbtorture tests run by the ksmbd CI over NTLM give the same
results as 7.3 with ksmbd-tools master, with no kernel warnings. NTLM
logins also work with 3.5.7. A test-only mountd that overrides the
expiry (including values above 2^32), the response size and the length
fields found no wrong session expiry and no kernel warnings in 313
logins.

Current ksmbd-tools master needs the tools change to work with this
patch. If you'd rather the kernel also kept accepting the 168-byte
layout, I can add that in a v2. Only tested with smbclient and
smbtorture on x86_64.

 fs/smb/server/auth.c          | 3 ++-
 fs/smb/server/ksmbd_netlink.h | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
index 1b24eb3f3998..8e5a1b10db6a 100644
--- a/fs/smb/server/auth.c
+++ b/fs/smb/server/auth.c
@@ -464,7 +464,8 @@ int ksmbd_krb5_authenticate(struct ksmbd_session *sess, char *in_blob,
 	memcpy(out_blob, resp->payload + resp->session_key_len,
 	       resp->spnego_blob_len);
 	*out_len = resp->spnego_blob_len;
-	sess->kerberos_expiry = resp->session_expiry;
+	sess->kerberos_expiry = (u64)resp->login_response.session_expiry_hi << 32 |
+				resp->login_response.session_expiry_lo;
 	retval = 0;
 out:
 	kvfree_sensitive(resp, sizeof(*resp) + resp->session_key_len +
diff --git a/fs/smb/server/ksmbd_netlink.h b/fs/smb/server/ksmbd_netlink.h
index 2673522c76bc..fc6af757e45e 100644
--- a/fs/smb/server/ksmbd_netlink.h
+++ b/fs/smb/server/ksmbd_netlink.h
@@ -148,7 +148,9 @@ struct ksmbd_login_response {
 	__u16	status;
 	__u16	hash_sz;			/* hash size */
 	__s8	hash[KSMBD_REQ_MAX_HASH_SZ];	/* password hash */
-	__u32	reserved[16];			/* Reserved room */
+	__u32	session_expiry_lo;	/* Kerberos ticket expiry, SPNEGO only */
+	__u32	session_expiry_hi;
+	__u32	reserved[14];			/* Reserved room */
 };
 
 /*
@@ -286,7 +288,6 @@ struct ksmbd_spnego_authen_response {
 				  * stored in SecurityBuffer of SMB2 SESSION
 				  * SETUP response
 				  */
-	__u64	session_expiry;	/* Kerberos ticket expiry time */
 	__u8	payload[]; /* session key + AP_REP */
 };
 
-- 
2.56.0

