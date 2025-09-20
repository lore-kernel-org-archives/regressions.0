Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7BC34BA28
	for <regressions@lists.linux.dev>; Sat, 20 Sep 2025 03:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758340309; cv=none; b=egvZi7wP2//M7udRlIog8ImZ0XlTk+YkbmC+XHAN1UpfJ7rG6qO6N3bZKjOkw4UQDFpZ8g1SmEKAermqPAJ00Q/lTdkTZqbJvlDl75RkqBSkoOSt5Nb7XYHyWukZ87r8yjd5krFCkAfvCs/b6aNs4vCiUmTSEfw554krDEYzGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758340309; c=relaxed/simple;
	bh=4nyax13VUWR5a5t0mPW0ffDF7ObllscDnqllciX7WU0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SG13yXiWde3kyr8Pd5EosDadAfzLWH9IN5hsiJtOZD6gtewlQ2CDdOCAsVLPYooo5mrA/FIfIaZOFwgAwYLZRWinZvPCI4QdMpgypdLDmG9zOFoBHtiltL6qpqwrr6Po/Pn2TiQ8eenSLsw+8R9qffu7heR8XLDVVhUyg4H7PDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wIl/WThV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wIl/WThV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32e09eaf85dso3242944a91.1
        for <regressions@lists.linux.dev>; Fri, 19 Sep 2025 20:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758340308; x=1758945108; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpEOj5LSM2D4OpUTxa8SKWTebNuWvFU+5fQLpVHxJlM=;
        b=wIl/WThVgiAHdJo3dSW41D7kkEnaogMENHYEcQmWoxoPr6O36YpHw9aNchfkodmowj
         vvimzFUQWUegruqE6VTN6ImXABciumGGO1n1GGNQNwyd9rQKx9g9+tP0YJ75sOlvXPCx
         gGhcT4cYHAkd3Pys5qfGHQRtRxn/y8VhmxYdsxGPp2Wv24KQ188MjzlgDp/YJ0U6DWoZ
         +uEDufV6XRoHxXxfvsFHei/M4LVy0+ah1rXoozUk8EcJrlETs8OUPOCu3lc0VScE+r6X
         u9/H0SkcMwxwHTnXKSAUgIzLioWQ761pTUw0IpG4m91oIK1cZHqGSvk0wfGs5hoRLki2
         f26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758340308; x=1758945108;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpEOj5LSM2D4OpUTxa8SKWTebNuWvFU+5fQLpVHxJlM=;
        b=S8CNc5j8qNx2AFfHseUDn2Jk3KnAtF2geyNVQmBDc0sY2DC50maJuf7s75ZMRcXd4K
         rUwnjRhq4Qkjfg+ajpSZpFuhbUfl+mPFrnlcnWnYhz3uOGo5t2+zKa46bsx8LQE2Tt23
         kIQVujL/DXNgViQ5g68Kt60DL9h4U8AHNjwjrL74kQuSYWg+bvyJ91Q76Zu88Ty3yxD3
         AxAJthGLRdn1PxWujTPgBCzPRZ3GOw6+24DchXcycugjVV0z1xx/H+yVDLOIbuN94gqB
         +UU5fIRuZs5lZYC9D54AQmTDe/+uu7GCOtwLEfK1zW6qJhj+0jHBWdFF8+a7PBFlc34p
         x0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVEJkcE8jql00loj4o2GX5YNjEMF0xQOWw/5/6pvpX1YB09pRLYlfSym1gsM0//1E5Tr5I21EDdlOH7tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZdEutgBBnxLQFem+vUGXnYfObRH8mQdJ+9L3snvVxPNRPFv7M
	ICFjAj5aQ+61PqDyeF/WlK5AN5giTvWxBgx1wbLRYRoz5YhcTQQPMuj790y8rrOABhQDX8yi6Fr
	vYjIPww==
X-Google-Smtp-Source: AGHT+IGDEsmJS0RWHAZl4i+dA/zrRM6jZJwlfPLgPe6OetInXPKDxFrf8pBdb+Fr9jhrRctW5rKl2lRcuTw=
X-Received: from pjbta12.prod.google.com ([2002:a17:90b:4ecc:b0:329:ccdd:e725])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3146:b0:330:604a:1009
 with SMTP id 98e67ed59e1d1-3309834c31fmr7114857a91.23.1758340307754; Fri, 19
 Sep 2025 20:51:47 -0700 (PDT)
Date: Sat, 20 Sep 2025 03:50:43 +0000
In-Reply-To: <caa08e5b15bc35b9f3c24f679c62ded1e8e58925.camel@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <caa08e5b15bc35b9f3c24f679c62ded1e8e58925.camel@gmail.com>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250920035146.2149127-1-kuniyu@google.com>
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
From: Kuniyuki Iwashima <kuniyu@google.com>
To: brian.scott.sampson@gmail.com
Cc: christian@heusel.eu, davem@davemloft.net, difrost.kernel@gmail.com, 
	dnaim@cachyos.org, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	kuni1840@gmail.com, kuniyu@google.com, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: brian.scott.sampson@gmail.com
Date: Wed, 17 Sep 2025 15:25:07 -0500
> > Thanks for testing the painful scenario.
> > 
> > Could you apply this on top of the previous diff and give it
> > another shot ?
> > 
> > I think the application hit a race similar to one in 43fb2b30eea7.
> Just tested again with latest mainline, but no change. Once suspended,
> keyboard becomes inactive and no longer accepts any input, so no way to
> switch to tty to view dmesg. The only way to move forward after
> suspending is holding down power to hard shutdown, then power back on.
> I tried enabling persistence in the systemd journal, then checking
> journalctl -k -b -1, but nothing is recorded from dmesg after the
> suspend.

Thank you for your patience.

I assumed SO_PASSCRED was the problem, but I missed
SO_PASSCRED was also inherited durint accept().

Could you apply this on top of the previous changes ?

Also, could you tell what desktop manager and distro
you are using ?  If this attempt fails, I'll try to
reproduce with the same version on my desktop.

---8<---
diff --git a/include/net/sock.h b/include/net/sock.h
index 211084602e01..b61d4fdb7fc4 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -541,7 +541,8 @@ struct sock {
 				sk_scm_rights : 1,
 				sk_scm_embryo_cred: 1,
 				sk_scm_parent_cred: 1,
-				sk_scm_unused : 2;
+				sk_scm_parent_sec: 1,
+				sk_scm_unused : 1;
 		};
 	};
 	u8			sk_clockid;
diff --git a/net/core/scm.c b/net/core/scm.c
index e603bf5400e0..359d56d454b4 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -435,7 +435,8 @@ static void scm_passec(struct sock *sk, struct msghdr *msg, struct scm_cookie *s
 	struct lsm_context ctx;
 	int err;
 
-	if (sk->sk_scm_security) {
+	if (sk->sk_scm_security || sk->sk_scm_parent_sec) {
+		WARN_ON_ONCE(!sk->sk_scm_security);
 		err = security_secid_to_secctx(scm->secid, &ctx);
 
 		if (err >= 0) {
@@ -449,7 +450,7 @@ static void scm_passec(struct sock *sk, struct msghdr *msg, struct scm_cookie *s
 
 static bool scm_has_secdata(struct sock *sk)
 {
-	return sk->sk_scm_security;
+	return sk->sk_scm_security || sk->sk_scm_parent_sec;
 }
 #else
 static void scm_passec(struct sock *sk, struct msghdr *msg, struct scm_cookie *scm)
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index b6ff7ad0443a..a35082269990 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1899,6 +1899,7 @@ static int unix_accept(struct socket *sock, struct socket *newsock,
 	unix_update_edges(unix_sk(tsk));
 	newsock->state = SS_CONNECTED;
 	tsk->sk_scm_parent_cred = sk->sk_scm_credentials;
+	tsk->sk_scm_parent_sec = sk->sk_scm_security;
 	sock_graft(tsk, newsock);
 	unix_state_unlock(tsk);
 	return 0;
---8<---
