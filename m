Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286341172A
	for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 08:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=juliahub.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=juliahub.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=juliahub.com header.i=@juliahub.com header.b="QB6lK7s0"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507bd19eac8so5506109e87.0
        for <regressions@lists.linux.dev>; Mon, 13 Nov 2023 00:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=juliahub.com; s=google; t=1699864493; x=1700469293; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nSmZOQp3NDYoYQRoOZeW69Lq5ePPtNZcj13zDtILkTQ=;
        b=QB6lK7s0BjGo6HTKxr9ASE7xuQjqtF8HkDPjabyw0lmD5OtnJzgjS9Y2YZ+whrAA5V
         7FD2YKq8ABzB5MJ+wGl9i2p1KhZeCtg7GeLIr8md373A9VlosjURujwhEv/Fcv3lNk67
         Fx2A69qvLr1nhMy01RZcKEeF4y+cZ7ApyEBK8OfgblBBhBm7fbseaYk5PPrK1l4MTX48
         Bhu4HyKsjvYMJWxcsPF7mSGS5J+0a/qDSwdwfpQNG1oJSfEq/POkAgTImRflQCBYvgUn
         dt+2PiejOkHRK4uQAxjUDpWFImaHqUfRkxNG3kCK1jZFBSnUoW0i+euEa+SawfGUi80i
         2NLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699864493; x=1700469293;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nSmZOQp3NDYoYQRoOZeW69Lq5ePPtNZcj13zDtILkTQ=;
        b=R2fC0tuF/cRKmlADiRz3KCrgZh5/uiYc3TQ/raDArEcy+FLL4nUpoNreicqQswxgnX
         S1Em0RiujYI7etPXnQ3rpZDLncab6wMOUxGcbUsFMlkk7REu7HyQDbTGgqIoPMgz9xQD
         zF/AW6EUOF/v6IsqNy1fZIr4LX54T/yt4PWpPFHVy6ORkWEvBatzmTPA7IPy1nfHAcDv
         B7/aRHoiGKCqZ9+/3z4Z6efzsJ0nZSVRHvMX7zZG4z/L5LIpnKFfoWiZa/6geGil0qAu
         cbyVoQuOTBiyPujd0WVppqLFy9+Fo/rAnVFHzzM4kDMVnJsXUjkKwVtiTEISFY0uTL0Y
         5lBQ==
X-Gm-Message-State: AOJu0Yz6NvNVpTs2enCN22zUy17YCSL2/rkAPxT+DPatZpSG33IC/BLW
	qeZQcJWvY9No7OiR1K59nZ3uQgz/TJh1PuTp6z+H1Q==
X-Google-Smtp-Source: AGHT+IFgq88MRaTHmaB9J8NNC+BSZ2b2vgGjklcYDBiGTryencLrXHqw3v0z2CHQw9bfeLiZxgYwLYjzwO05rQCXNX8=
X-Received: by 2002:a05:6512:3904:b0:503:258f:fd1b with SMTP id
 a4-20020a056512390400b00503258ffd1bmr3749298lfu.18.1699864492911; Mon, 13 Nov
 2023 00:34:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Keno Fischer <keno@juliahub.com>
Date: Mon, 13 Nov 2023 03:34:16 -0500
Message-ID: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
Subject: Incomplete stable drm/ast backport - screen freeze on boot
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, sashal@kernel.org, tzimmermann@suse.de, 
	jfalempe@redhat.com, airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Greetings,

When connected to a remote machine via the BMC KVM functionality,
I am experiencing screen freezes on boot when using 6.5 stable,
but not master.

The BMC on the machine in question is an ASpeed AST2600.
A quick bisect shows the problematic commit to be 2fb9667
("drm/ast: report connection status on Display Port.").
This is commit f81bb0ac upstream.

I believe the problem is that the previous commit in the series
e329cb5 ("drm/ast: Add BMC virtual connector")
was not backported to the stable branch.
As a consequence, it appears that the more accurate DP state detection
is causing the kernel to believe that no display is connected,
even when the BMC's virtual display is in fact in use.
A cherry-pick of e329cb5 onto the stable branch resolves the issue.

Cheers,
Keno
