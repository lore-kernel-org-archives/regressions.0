Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110671FDE02
	for <regressions@lists.linux.dev>; Wed, 11 Jun 2025 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660225; cv=none; b=PpNZEG0Ak6im2hge+bumnNnedweFEe7I6MTk0+SPhWzo2nsIbRou2ZlWG7yawV44Xy1PuYuVxIm9FztoZLsqBRv/hEiXMtS+uIjxiEF18VWVMnqDof6Q1MQe7mSr8Ze37q7laeko/mUmkp9O5isSjsZYWwWhSUoq/U3efyrmw5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660225; c=relaxed/simple;
	bh=Xjk6jlbvqJxFCXtvHLCcHfI2ncwIxhB0uF95GAVPX9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PiQ4/IZiBf7ZX0gd0H6GNyjJjE7AWs59JPKJxaFfe3xQs4/ago4m9EKkBwp+KAVc6Tk56CS+tteoFODJe4sS4HfYa0kjjRoUiUDgOkH14JXTQ1AUomVDNEVVmfqySY3eiM57AvI0OKl5PIdZAr+/AFl53lH7a++R/9uicdy2rgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avRy0X1W; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avRy0X1W"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso99912b3a.2
        for <regressions@lists.linux.dev>; Wed, 11 Jun 2025 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749660222; x=1750265022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7I0KZjZcuxlm3KvqwjQhi1svjF1BUWgM7RrOG1tQndc=;
        b=avRy0X1WamEI2aWFCa36JwkGW5GDGJRqNv+3bplqODln5TRtJY6MX8IwGXa7FElkBi
         gIhhOg1llvIodhIzvVQ3LmYSbjA9I0vtai3WQfaVxF/OZyOakYeKpdhbOBDEUPBOI92+
         drk9BUKOp48UCw5uIqgapD8yDyoMNRMyPA6FU9LMd3MXtJcibOB7i6u/VK1ZnYGOeLhK
         arNzRj1Jz/3k1ajITJDYOIEtx7+V0CAh+uey2dA2ww4RlAJIWKHRwZdbMpTDSvCmCv5E
         LUMrv9b0Vxl3yQrwwjpHj4MFG30wICsXEH6kSC7nXnCXR0o8TKm29F4npCNSFVPC8MCu
         /H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749660222; x=1750265022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7I0KZjZcuxlm3KvqwjQhi1svjF1BUWgM7RrOG1tQndc=;
        b=PNSePXLEPu9Nx+l9bYxCwJe89ViKlxGD6wAMFLdf0h8iX1+TFD7pFFopyuoWsK4rbC
         ikDYtx+aQHba53YUne4bWpNiZF5D2abay4FM1HMcoHvsMaQIfeYKCgsXqEcG6x/es08I
         5c4i143eRZuREJ6HXGNreFmX/5f4efimT7iCejkcpw8ZWit5OP5uep43fQs7GnRnc1n2
         8RONj2zhNPxZ3wOomueOe4Hvu2d0h1w9pAxzcNnfSJmFXCDhm/C1d/8eOVNW5U105rfp
         lfyfOs04mCh2e4KoX7F0Z1MBBz/8d9D4kCZu3iXI+Xla6Yrqim9oUMl+0a7UrGg4FZGa
         rwMw==
X-Forwarded-Encrypted: i=1; AJvYcCXu/qPmK7RvPfAHchxhRSBBR5KasUDEiN/Il4VP4NTYzZ1jI3vuvTWZWyrpGnsYuWzHBTFOo98BnzKqUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yww8tyb5XYcbhv0/hWq8ROENG4piqMtD+vA8nrCzEhXBwC4aMk8
	o3ocq4n7kNehokHWchYr1asX85+LAjqJh3uP5GY7jMg5UVd+g4HPgwI=
X-Gm-Gg: ASbGncswZ4ujwZs7vNe+2T6NXJSco+P3+1MEHaS4ast3RseX40J9NjKYmIk7RT75kgI
	ItkzCY6Z6QJ+c91dPjCy+9X9xW8oBKujmmH5hE16SM9bT2YwIYklRw6Y7Od10crIjCPIY4tYNkm
	1jscDkU4GLHhcvF0RJ0jroIFLmIGBcnQQkjC+SeLwGqq/ZijhNCUU1/pL7DIUr0bzWyZQOEhPGd
	5ONIsmAuH8Y1mb1Dt5YsBOPyp9WUiTat+cPE17EbI/j56wl9o2BsOKFr83XiSaq+hn1pZo9DGzM
	iFuL9wBY4xoOcaXxLuMbfDu5t1eEMqy+7SSlsIs=
X-Google-Smtp-Source: AGHT+IHK1hZHCZkZXsnAgHk1raXAb/+BFYH1b8S96weug7GKHBU9JBTLLWV5Ri0WxGqA+7TLEBKnow==
X-Received: by 2002:a05:6a00:2d03:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-7486cb44b36mr5627782b3a.3.1749660222115;
        Wed, 11 Jun 2025 09:43:42 -0700 (PDT)
Received: from fedora.. ([2601:647:6700:3390::c8d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c8a6bsm9702847b3a.142.2025.06.11.09.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:43:41 -0700 (PDT)
From: Kuniyuki Iwashima <kuni1840@gmail.com>
To: christian@heusel.eu
Cc: davem@davemloft.net,
	difrost.kernel@gmail.com,
	dnaim@cachyos.org,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	kuni1840@gmail.com,
	kuniyu@amazon.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
Date: Wed, 11 Jun 2025 09:42:20 -0700
Message-ID: <20250611164339.2828069-1-kuni1840@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <58be003a-c956-494b-be04-09a5d2c411b9@heusel.eu>
References: <58be003a-c956-494b-be04-09a5d2c411b9@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian Heusel <christian@heusel.eu>
Date: Wed, 11 Jun 2025 13:46:01 +0200
> On 25/06/10 09:22PM, Jacek Łuczak wrote:
> > Hi,
> 
> Hey,
> 
> > Bisection points to:
> > [3f84d577b79d2fce8221244f2509734940609ca6] af_unix: Inherit sk_flags
> > at connect().
> 
> I'm also suffering from an issue that I have bisected to the same commit,
> although in a totally different environment and with other reproduction
> steps: For me the Xorg server crashes as soon as I re-plug my laptops
> power chord and afterwards I can only switch to a TTY to debug. No
> errors are logged in the dmesg.
> 
> This is the relevant excerpt from the Xorg log (full one is attached):
> 
> [    36.544] (EE) modeset(0): Failed to set CTM property: -13
> [    36.544] (EE) modeset(0): Failed to set CTM property: -13
> [    36.544] (II) modeset(0): EDID vendor "LEN", prod id 16553
> [    36.544] (II) modeset(0): Printing DDC gathered Modelines:
> [    36.544] (II) modeset(0): Modeline "1920x1080"x0.0  138.78  1920 1968 2000 2080  1080 1090 1096 1112 -hsync -vsync (66.7 kHz eP)
> [    36.547] (EE) modeset(0): Failed to set CTM property: -13
> [    36.547] (EE) modeset(0): Failed to set CTM property: -13
> [    36.547] (II) modeset(0): EDID vendor "LEN", prod id 16553
> [    36.547] (II) modeset(0): Printing DDC gathered Modelines:
> [    36.547] (II) modeset(0): Modeline "1920x1080"x0.0  138.78  1920 1968 2000 2080  1080 1090 1096 1112 -hsync -vsync (66.7 kHz eP)
> [    36.897] (WW) modeset(0): Present-unflip: queue flip during flip on CRTC 0 failed: Permission denied
> [    37.196] (EE) modeset(0): Failed to set CTM property: -13
> [    37.196] (EE) modeset(0): failed to set mode: No such file or directory
> 
> 
> I can also confirm that reverting the patch on top of 6.16-rc1 fixes the
> issue for me (thanks for coming up with the revert to Naim from the
> CachyOS team!).
> 
> My xorg version is 21.1.16-1 on Arch Linux and I have attached the
> revert, my xorg log from the crash and bisection log to this mail!
> 
> I'll also CC a few of the netdev people that might have further insights
> for this issue!
> 
> > Reverting entire SO_PASSRIGHTS fixes the issue.

Thanks for the report.

Could you test the diff below ?

look like some programs start listen()ing before setting
SO_PASSCRED or SO_PASSPIDFD and there's a small race window.

---8<---
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index fd6b5e17f6c4..87439d7f965d 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1971,7 +1971,8 @@ static void unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
 	if (UNIXCB(skb).pid)
 		return;
 
-	if (unix_may_passcred(sk) || unix_may_passcred(other)) {
+	if (unix_may_passcred(sk) || unix_may_passcred(other) ||
+	    !other->sk_socket) {
 		UNIXCB(skb).pid = get_pid(task_tgid(current));
 		current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
 	}
---8<---
