Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583646;
	b=ezP5zWBxbIj1lOLDgAuDwKWJ8pHWTow0WbdHpFWrzpYgvm71Y3mqffvCcq7/85kyCpKd
	 lGkK08gIoVXV6USKdNZAHJ7UDkLq17nXLuHpgddi9uR2/S/fpPXOekgpZsD2fOR8muYs/
	 3J53ADOpndJlRzSCkyc7KMTXmLNI070hUZaF11RnrIfKMFJAur6IDM4eolBaQZMduNqQn
	 GgfN/6eSxW6eUwWEldGMXyepqieWvGibzoDsWaXCvCj4OaNcV1ic2jGirkeTRI6YgvEjZ
	 IgJq/qYi6lWHW4Hadfh+Ottbc7S/IM2GiZZJ+YJqgDeN5oi3Fn4Tb7xICv9xB6wrwwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
	b=CK0Brq9u3NUXC77rqnf7EEILdfEdQjoROVq9Tqe6rUluDanFlwFoK9rKGpiuvLdL1vgR
	 wNe33axrkNnTnQxN0EnjANXG67t6CKVX3Ph2CvvbL0tiHYO3uvM3lUnV1VFfwXk+WGsSu
	 H702HSDmrAHj32Lc7oQrhw92VyLYe5NqZq/9cY6nb6emXOcQt4Prt03MMNx+jPw4nt8RE
	 LhhLpOFzZpGu9PHY0mX9o3zi9CVrXt1rZ8Jcymdutr5094o951kcGsNDxDWpyst6SStoS
	 jsjBwnskgH7JNjBoRGz/Ufuhow3mzD0xSE1sChR6RoJzpxUUYkGQWldGZXlTEH9VC7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mVWXwXXE;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49C606A33B
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 11:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA49C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mVWXwXXE
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso83436166b.2
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583644; x=1793188444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
        b=mVWXwXXE5DT/XAVUepxr5yjGKBXqR3czEMvuzYQLwlf9FJbWxV7Y6ArGmXkqmAfsWq
         3MqdxfQShofiDapYqTntBvIwm1KCNqohzrpcq4m5T4RoCukH2Fu9winZCzoPsgQDXVfa
         cM+GZeuz0RboWj+e/x7xuYoBboEh1whaOdDnccs4FurstGiMgnjvw85NDeEWFCXD2FzN
         IZ4fuqX8F9qit90f/dSjjb6rMbZLOSVKyezk1zStvOZoVhS6hA7V/Yji2+NbEhqH6WFG
         u4C1fDOFUfvLWdcC8g9hiECGjVyUh5w+7oyJvHd/paxN73QYsJ3RVB86fbMlBxjVVzwd
         eqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583644; x=1793188444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khbtvnCt8sXvEtX9fI1U36fFGjo7tER69Bnnl50Wz8Y=;
        b=aY/RojDue3CATeO9UNUWo7Hc23oyDvKmBfn4Lx1HabYR0Sl3/7rCqpjvhtPzbqwh8c
         MapyZn0GJ+oeT3hMYtRvoQiSBmUmkrxs3KqgoGvZR5GxKnXxy0AFKhbw0LwTykARFQkK
         Z8jNHEED8RtLzir0I1isaN4BsA2hn0NnX4Z0JxU+RuLFvq/wAU17jzNSV37BTfypY1RH
         GGLWtii6u1f6UWNAex43iFEizMjJJydr6uQvCrXVKbfSMdVeYc3aGXRec3Fj5bVrPqrb
         V8de5fBPBuh24dEbGe6IyfMb23m24AH6CUsNCwxIFjoeK4bP7JxtZOw5bZwoK/Yapcwo
         I2NQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1eirkNDcBgIFLfoklH1iSa13WmWMbFOUmTZnJG1bY1ZvzHx/LaugJxJRU2um3l5c3lRQbxlcJsCK/OA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKw1z1kezIC5zQy18pK1/N8hWVxnjc/9FtHn6dM6JdBnQswXfXC
	hdloKgYGuK4fkAguV89wpC11GLDVlauKHJ4P9TP9OUhttRpv98SjhEbw
X-Gm-Gg: AYBFou0I4qlfdYtFII7eE2yD8Sdn+1wfbHJR4Q2sa6czGLBAO77gM7mpE9SvVZUAuEk
	OgWQvbaApOzCe1LrOxEGPMoGCfCIF4d4ZIqqinZFj6STqjE89jJlN2YNCfotjSFfagCQRfD+sLH
	GDVyokZgTVR8pCXRL/EM9WFK3VG7lSmqZL9LOKB+/Uyfzal1BapLjk8WYK7UftatZxqWgAB7Izr
	xFc60bJGtA7rHFLYBi5Vdk6E0kHbnThPSRTSy/GwoBrICHZRmF3XIqeklG/Xvir22WcOl4vWPg9
	DenyWcye75Ewpph7ukrqHWcJQ3Fg9PDLSmjHa8wqvaMqqi9R00Lcb2AVN4uULVT+2ADt1Pv6cSn
	odMJuRKNBrnERFcmrTjbxJjcz5LOjvwOm7bVx02YrtdG6IjLD8jzY+OtYeog6YtU+1cJU/IRnXX
	rQOlFml4H77ebu6SSKA2XQaEMvE90dgwKRmvLVNEhDlFGNh1u2fxmGdcqXPNu35LHOh35ruY5NJ
	rdJOPaApaJRYUJq/II3xLznDxKpKtW4hyIiZRFNHqmpg/OXcrtGn9mKgKC7WDbxcJpYDBSaABZ1
	DEPcUXnHfi1SOAgJ9UabEtKZax95wV99Tm/KMJrrMomYN+pSBQG1VTJbPJWl004iXVvO
X-Received: by 2002:a17:907:868c:b0:c29:f5d8:9c73 with SMTP id a640c23a62f3a-c467979bbffmr167724266b.34.1792583643843;
        Wed, 21 Oct 2026 04:54:03 -0700 (PDT)
Received: from wlan-199066.nbw.tue.nl (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77ac4sm69316066b.28.2026.10.21.04.54.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 04:54:03 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 13:54:00 +0200
Message-ID: <20261021115400.30885-1-mike.michalo@gmail.com>
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

