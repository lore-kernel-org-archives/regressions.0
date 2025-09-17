Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB52301024
	for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758134590; cv=none; b=Vr35WVm51HTL4nUtcHlQ3Jzu7Fh1zK9CSh+esQ7RU+g0Etz5WZSJwArqPcjCdj1KoL1nznkzGf34nt8Xi7rHe1tgY7Ad08Pe1LqR3xKhrWl/gkYKPwYyTIAuUuzLOeMj+CixdCuyKV6aJTxS48k0gDtkavzHTveH8zOOhqX+bBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758134590; c=relaxed/simple;
	bh=CO4Z2qhPiwjLUf9m3lqbizWU30ePe61aVaBOg25eiMw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BgZ2oE8EvVTjdmfR52GVU0Rb6HKmQUWd9tAsGI3NqlzvyP/b1L6gwkFd/ZZSWYZQgfCA7544nqBoCm7jsgPugV3zNv3nV+97X/st+zo7oqrLz1h8WQ889Yt+3uIlH/3TmezDmFZWSrFWJkugdiXmcklzJg2hw2pcTziiY9STpkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ry1Ucbo/; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ry1Ucbo/"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32e09eaf85dso75512a91.1
        for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 11:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758134588; x=1758739388; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnn/1bPiYFjxxZYlOzXb5RYuvwtgWrVEsfiGmhllIQo=;
        b=ry1Ucbo/v6/Vy8l0Nd4PCcaLKCGB6HdEU7uJ+o0SYPFGmkffpmQiJVrqiCX6d3ArlV
         w05n6On5Q+E/89zQa3+aFCNdfRyk0NuLLhONpN1LqIwTa+4qNim19QTFMsQqZHmWVpq+
         sUTowgl0SEhbGHP5h7dtx7JeTJVr2PENsV664EzsA7OoU7GzP4wIKL79jvOTXpuRpxOi
         GpnecXNf2z4HJq5ib3v8ftNX1IJ/u2wDrMNvazlgcZYMuExOsVn/3966n/UkeEB+KF64
         5H5ou8qXWsSGOej+D//Q8NJimf/dvq4YhfTh8z+a6XULHfuEQZokNsOiKTBn1euhM2Li
         LkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758134588; x=1758739388;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnn/1bPiYFjxxZYlOzXb5RYuvwtgWrVEsfiGmhllIQo=;
        b=gyCOT1Xvy/ogSD6aZoX/H7ho6DQZ4kEl985cMNq8ICC5aqvFcA/fVKBZwbvZ3kZu7j
         0gbOi/vO5ofAC+gJMGFoVZ1Mx3+ZGQilppP5I3MZq3aSa0UUhRbEyD9Es6XuZpyuBREx
         d7zwTc0EMUThe3EjS7C8caXod4sOGgitntJh4pG3Rng2iGLcQ8wdhZRGDdsVuuqPmTCN
         xXHYhG6reir3tvYdKUhxpOD8CQXaK2SaHku1akkp4mP2/MEpOCwhcdmILNJs+RIWsmOP
         TuEXhaq3dE2Sup+UVbvqOWMLCv9oc/AXMHgQOptlobAbVPI9Yoth7VUOT0xU2Xe2T5JH
         5qXg==
X-Forwarded-Encrypted: i=1; AJvYcCWGFC8TO9XfqLZoum3H7+npdwE49vEIu5GAgzJzWXwNcw/ihs9rB1oL8PWFzlcZH/x3OvDLvPyBbp/OFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT1w9lW/CBtnn21Tce7feU4h0rX1S6CqoaDssUxCCNCPpwVjnu
	FAEXESeW44ECtT12YTdcTBPdRPZX8AdwKP+GXs7Yr20iywJKZKTTd6nO4GRg7bC/JiIqmm8dBAV
	u2s1iBQ==
X-Google-Smtp-Source: AGHT+IEhGNWjJW1GJ5MpbhHOgHkB45XQY9aZPy3HjmU7BORBjFIa87Gpe9fvclpNk85p/3LCUAJSkOe2WNw=
X-Received: from pjbpb7.prod.google.com ([2002:a17:90b:3c07:b0:32e:8c6a:e6fd])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3902:b0:32d:ea1c:a4e5
 with SMTP id 98e67ed59e1d1-32ee3eee5a0mr3788820a91.1.1758134588448; Wed, 17
 Sep 2025 11:43:08 -0700 (PDT)
Date: Wed, 17 Sep 2025 18:42:58 +0000
In-Reply-To: <d994dd8855c3977190b23acbe643c536deb3af71.camel@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <d994dd8855c3977190b23acbe643c536deb3af71.camel@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250917184307.999737-1-kuniyu@google.com>
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
Date: Wed, 17 Sep 2025 09:40:22 -0500
> > Could you test it with this diff and see if 2 or 3 splats are logged
> > in dmesg ?  and in that case, please share the stack traces.
> > 
> > I expect this won't trigger the black screen and you can check dmesg
> > after resume.
> > 
> > Thanks!
> > 
> > 
> Good morning/afternoon. Applied this patch to the latest mainline, but
> still see the black screen upon trying to resume after suspend. The
> keyboard looks to be unresponsive, as trying to switch to a tty
> terminal or back doesn't result in anything happening(as well as
> numlock/caps not being responsive either). I also tried using the power
> button, as well as closing/reopening the laptop lid to see if I could
> trigger resume. 
> 
> Checked the systemd journal just in case, but no splats or anything
> else is recorded after the suspend. Finally, attempted following dmesg
> with -Wh to a text file before suspending, but that also doesn't record
> any new input after the suspend.

Thanks for testing the painful scenario.

Could you apply this on top of the previous diff and give it
another shot ?

I think the application hit a race similar to one in 43fb2b30eea7.

---8<---
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 6d7c110814ff..b6ff7ad0443a 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -815,7 +815,8 @@ static void copy_peercred(struct sock *sk, struct sock *peersk)
 
 static bool unix_may_passcred(const struct sock *sk)
 {
-	return sk->sk_scm_credentials || sk->sk_scm_pidfd;
+	WARN_ON_ONCE(!sk->sk_scm_credentials && sk->sk_scm_parent_cred);
+	return sk->sk_scm_credentials || sk->sk_scm_pidfd || sk->sk_scm_parent_cred;
 }
 
 static int unix_listen(struct socket *sock, int backlog)
---8<---
