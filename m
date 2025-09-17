Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632951B0420
	for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758072835; cv=none; b=f5VSeP9hCF7h6pdenldHhtWdg7uUjDUpZ6fO7nUvgaCIUlmCziw2wepaSE/QnQGTtb5m0o05m7IojcFWGHXzgMF5rhwFQDPjOo71zozdvbawCPp5Ay3u7w540OAg1VdqdNAm86rXDaW7XLekkMqp522hj0+v8USrSAKExQlpL1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758072835; c=relaxed/simple;
	bh=0heUhGb7g54M8ozu1OASeuvS0XjRgdig+E1hh5iT4sY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YHZ/fxkW2vgSNYEkhkypmeO6w2EfckyKdDYK4tNz1rsCG6wg251FjxKauvuhChLEKCdh0yhIbBdfI74WaHNqjD9Da0BYJEwfQWd2e4tufg0C8rmjnuD+k0vBBBk52bSNB7aNNxZDSF6bhZwZmnexvdYhazmJ0RudNuyTeE7Wt7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asuzUjDW; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asuzUjDW"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b54d1ae6fb3so1929909a12.2
        for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 18:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758072834; x=1758677634; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXpZpJMeVhGYO9gIBZ2NZsGYecTrOOiKqT7H+6noy3Y=;
        b=asuzUjDWSKUyqRjY8aiwSlm+Qv+vdYQU8PUbMkgBdrj9dxonRX6cj4h0I0Nngiz/dO
         Ft6niT1BTKDjGXIBdvstxhV3e3QYKSTXEiB+qB/P9w2mfqmVZM1bwnu0uP2mLMJKgs6C
         O4cQoTi8J1t2Tyq1cu7jmuIxtApmi+sJWGaTznj9Zb/mU+wlQF041xv3sg6dpRRyi0N7
         I0UnhCjvYNkkVtFmhcFoBfOQt+Zy8ItPj8LSXT07EG5+ZtW0yWwnPpCDPXnHXKr+XBvo
         O6sJfhXF0eJHug+SHEsPcRBfLC+mBfTBOQMr+n/JqRx7d3pj53kdFeK5FWDetbl4c3h/
         /b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758072834; x=1758677634;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXpZpJMeVhGYO9gIBZ2NZsGYecTrOOiKqT7H+6noy3Y=;
        b=YncX0okVRQUU0wVgaHBoVHNZYKyxhuraSMlNxbfafPEp7Jzfg86mt9mxiW5RvYYX5v
         /YDMTkfoLUJCSI6Dh1oumfadTlmjxnRD0Vj2IBaR5R3jipJDiD0tcTpn1Sk+ESfPz8MD
         +G0y+U0NovuKpWWeSx1idg7p2XDCuUK9XVmEfT9vaGkOlBTT1v7nfGr9p2N65i1LSPkC
         YKuxcU3jrvL4i6pdjmdFjoSK0jqOqUuyjtv7evzijz51O8CaGCTIR/62EXHlklEWtrXY
         /ZexFrbG1iLiX6nZ9m2FItoe8hm1XRZdw79T432I1p/PfigsBYUTy87qJbGw5Ofe+Mx6
         XsmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ1aGdV45fAmlaNDqijqVvOp0lcNZgJ5CtwpCmMnMAOm4ESFP0/6bH170QZuPIkwBGmTktBpTDtukB2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFpn3jVzgDD/WB4LmRxn6JqzwFk4PaB0hpdyoBuxFvD/eMSoJp
	nc4d7pBNQFX03QylWAWp+OeLKiobhlfqT1FjOFBqxVbaYwSk6n82UiLhpKOyyb0m/uG3zYQQelG
	UeFGIrg==
X-Google-Smtp-Source: AGHT+IEMVleSkK89gkmfEHssr+X+W6hD8LJmFm5iv+hvPkzIpLwz9m1GYDcafkkn4/PO2fHFkjoJDXasCUI=
X-Received: from plbix5.prod.google.com ([2002:a17:902:f805:b0:249:3ba9:c64])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e888:b0:234:9656:7db9
 with SMTP id d9443c01a7336-268136f9e3emr3836345ad.32.1758072833656; Tue, 16
 Sep 2025 18:33:53 -0700 (PDT)
Date: Wed, 17 Sep 2025 01:33:33 +0000
In-Reply-To: <c36676c1640cefad7f8066a98be9b9e99d233bef.camel@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <c36676c1640cefad7f8066a98be9b9e99d233bef.camel@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250917013352.722151-1-kuniyu@google.com>
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
Date: Tue, 16 Sep 2025 17:16:40 -0500
> > Thanks for the report.
> > 
> > Could you test the diff below ?
> > 
> > look like some programs start listen()ing before setting
> > SO_PASSCRED or SO_PASSPIDFD and there's a small race window.
> > 
> > ---8<---
> > diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> > index fd6b5e17f6c4..87439d7f965d 100644
> > --- a/net/unix/af_unix.c
> > +++ b/net/unix/af_unix.c
> > @@ -1971,7 +1971,8 @@ static void unix_maybe_add_creds(struct sk_buff
> > *skb, const struct sock *sk,
> >  	if (UNIXCB(skb).pid)
> >  		return;
> >  
> > -	if (unix_may_passcred(sk) || unix_may_passcred(other)) {
> > +	if (unix_may_passcred(sk) || unix_may_passcred(other) ||
> > +	    !other->sk_socket) {
> >  		UNIXCB(skb).pid = get_pid(task_tgid(current));
> >  		current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
> >  	}
> > ---8<---
> Just came across this when troubleshooting a resume from suspend issue
> where I'm get a black screen after suspend. Initially saw this with my
> distribution's(Linux 6.16.7-2-cachyos) kernel, and confirmed the issue
> in the latest version of the vanilla mainline kernel. Bisection is also
> pointing to commit 3f84d577b79d2fce8221244f2509734940609ca6.
> 
> This patch appears to be already applied in the mainline kernel, so
> this might be something different. I'm new to mailing lists, so wasn't
> sure if I should report this issue here or start a new email chain.

Could you test it with this diff and see if 2 or 3 splats are logged
in dmesg ?  and in that case, please share the stack traces.

I expect this won't trigger the black screen and you can check dmesg
after resume.

Thanks!

---8<---
diff --git a/include/net/sock.h b/include/net/sock.h
index fb13322a11fc..211084602e01 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -539,7 +539,9 @@ struct sock {
 				sk_scm_security : 1,
 				sk_scm_pidfd : 1,
 				sk_scm_rights : 1,
-				sk_scm_unused : 4;
+				sk_scm_embryo_cred: 1,
+				sk_scm_parent_cred: 1,
+				sk_scm_unused : 2;
 		};
 	};
 	u8			sk_clockid;
diff --git a/net/core/scm.c b/net/core/scm.c
index 072d5742440a..e603bf5400e0 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -510,7 +510,7 @@ static bool __scm_recv_common(struct sock *sk, struct msghdr *msg,
 		return false;
 	}
 
-	if (sk->sk_scm_credentials) {
+	if (sk->sk_scm_credentials || sk->sk_scm_parent_cred) {
 		struct user_namespace *current_ns = current_user_ns();
 		struct ucred ucreds = {
 			.pid = scm->creds.pid,
@@ -518,6 +518,11 @@ static bool __scm_recv_common(struct sock *sk, struct msghdr *msg,
 			.gid = from_kgid_munged(current_ns, scm->creds.gid),
 		};
 
+		WARN_ON_ONCE(!sk->sk_scm_credentials && sk->sk_scm_parent_cred &&
+			     sk->sk_scm_embryo_cred);
+		WARN_ON_ONCE(!sk->sk_scm_credentials && sk->sk_scm_parent_cred &&
+			     !sk->sk_scm_embryo_cred);
+
 		put_cmsg(msg, SOL_SOCKET, SCM_CREDENTIALS, sizeof(ucreds), &ucreds);
 	}
 
diff --git a/net/core/sock.c b/net/core/sock.c
index 158bddd23134..ff68b8f7c119 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1545,6 +1545,9 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 		break;
 
 	case SO_PASSCRED:
+		WARN_ON_ONCE(sk_is_unix(sk) && sk->sk_state == TCP_LISTEN &&
+			     skb_queue_len_lockless(&sk->sk_receive_queue));
+
 		if (sk_may_scm_recv(sk))
 			sk->sk_scm_credentials = valbool;
 		else
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 6d7c110814ff..c8ea44f6d1d7 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1897,6 +1897,7 @@ static int unix_accept(struct socket *sock, struct socket *newsock,
 	unix_state_lock(tsk);
 	unix_update_edges(unix_sk(tsk));
 	newsock->state = SS_CONNECTED;
+	tsk->sk_scm_parent_cred = sk->sk_scm_credentials;
 	sock_graft(tsk, newsock);
 	unix_state_unlock(tsk);
 	return 0;
@@ -2037,7 +2038,7 @@ static void unix_skb_to_scm(struct sk_buff *skb, struct scm_cookie *scm)
  * Return: On success zero, on error a negative error code is returned.
  */
 static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
-				const struct sock *other)
+				struct sock *other)
 {
 	if (UNIXCB(skb).pid)
 		return 0;
@@ -2047,6 +2048,9 @@ static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
 		struct pid *pid;
 		int err;
 
+		if (!other->sk_socket)
+			other->sk_scm_embryo_cred = true;
+
 		pid = task_tgid(current);
 		err = pidfs_register_pid(pid);
 		if (unlikely(err))
---8<---
