Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080332475C2
	for <regressions@lists.linux.dev>; Tue, 10 Jun 2025 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583337; cv=none; b=qH12QLScZC5Fnm7QeAIiZPl6X2NOpzZ5IN8NnVrleUrF5KdIUEgi9uEXyl5DIhkI5NioqF/zwmUfk8LKYAgWdqWDh08Vca1hRAzyrN2y3cJywnL+GfniWAvX05boe6azdIw7nMcS43xQ8EjnSOsBEz8MItTyMSIAiqBW7Sr28T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583337; c=relaxed/simple;
	bh=XCBX1JsgByEU7BhJ/ONd+4pS63Yo3AaGmGii1KZYUPE=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject:Cc; b=uZAB218ZGsfbwbOgBF5Lmc5Zo3nSMm1T2h0Q1Q6Zhcj971Q36/gVHedE8gbQ+J5qigH1tVuhqRh9LsjR86Mu0sUw1YJCKKu0QO8FZ565YXhGpt9GhEa8g6xRVx9hEsu/uRGrInBaIZidAjGdflqE3XwRElMP4mnVTshQ4eDU+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anlAsqpS; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anlAsqpS"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so6772829a12.0
        for <regressions@lists.linux.dev>; Tue, 10 Jun 2025 12:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749583334; x=1750188134; darn=lists.linux.dev;
        h=cc:subject:from:content-language:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CuGklJMo/XggvT3Tyw+5VNTm4uABfvioey+NKWNRuc8=;
        b=anlAsqpS0aPYsgbmrHKGaDFhTa9MKy2IcFsEpaPHzoHurHsO3Dj03d4aXszXynX/6u
         Q/g4/zmsvTwZJfIt7OHqKonCWVGxjQ8vA7pXr31DIGOQ6/QYZ1S7h9eciZ8tlr/piY1A
         zwag1MligRahG0l8e7pyHrQ9k/78ueqJy2d1RVqLDNpuxe6Qp/3NN5BtgULvSztHnGgw
         eO7B30GntIcioPCOnGsGnqg1m6iHeDwyPIXghp/ouirt4zFkvdJxe+WgzPb6oz7j8BEu
         sTN+LkJbDZ9D6nwSEjZ0LroZloY4KnxRWCJl76WSj2M00UvWGD3BlqjNy2NLBxatlGAg
         Nvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749583334; x=1750188134;
        h=cc:subject:from:content-language:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuGklJMo/XggvT3Tyw+5VNTm4uABfvioey+NKWNRuc8=;
        b=CvXRHTlzPqI67PbclIRgK+8COSpBXExCZRXEL1sNITzFjW+u76X9Cuusi2+XcdfZ7t
         7Qvpqp77U+4DsDNJGXMBHDyS4Owd2SgYUTa2vTJd0HyZ/zCZPj+wpbUfT1zieK1ZXWmx
         C295WJfKJdA6A3oR0D/S8+DUAd39MvP8ldc7mK+SDTxsOn/8TffgMAPvwDvNver3wBY3
         g1iBsUnTHiLnW/+umQ8gXFWo6lPPJvNaX0DvhKZ7VaYVzMVToc9zmbxWV40Bj6yAtfZR
         P/BvP1HZ/U3MvE24tf2JGPp6YHv4Rw48b18pQ5YJ2s4Fydm8CV6O+sK7cLLXv5Ftmivy
         L/ZQ==
X-Gm-Message-State: AOJu0Yz2s9DJND7hvAhrvnR+LXSJAqERGAOwcnClD0XbdOG+CcCQ3PX6
	nNJoLjlIPMmjSesfwnV5ZvxmPfQIhcKdDeNWeCrP+TVbp55iRYh1tbVGGt4ylA==
X-Gm-Gg: ASbGncs0evSkSDCsivkLyIYkwUniTVEppJpmUT2oMTpOHhhNhZ/2hBi/Ql4Uz6wnXdL
	EkytHuXdyptZEp7I+XhawaYxbAROypjnGuJFaA6X0wahSNEg4QhonnDOfudizNIXuzLGK8qM3nO
	KZGWz5ijCXJs6Q7Sl0py7WKxmJDKllzq8JoiBfibh/rq/1edq8iml6cn9Tt4y7OdGPr9jqkB6TN
	GrsQpIHHx6XiJd59ZudbhRjlcTUDPHZ+SGq64BkUS3njl7I77e61XRwPRaZpO6FbTjBgyy1YV5l
	V4qRnPFu6XXI+6HVbcAUJCqu9f/5qDzwbPt7zXj5ocxNTDOUQuka6w1cLgv+JVZ5VOnsiNyRbsM
	=
X-Google-Smtp-Source: AGHT+IG9kBSw2X1ccnCxO1Js5aErCwKTjsabwdIL7nKGeo+Y6csVE3eNKeM0NmP5wZAzmms6SHf8xQ==
X-Received: by 2002:a17:907:7b88:b0:ade:4339:9358 with SMTP id a640c23a62f3a-ade8c76cb06mr4699466b.22.1749583333627;
        Tue, 10 Jun 2025 12:22:13 -0700 (PDT)
Received: from [192.168.178.70] ([91.90.160.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55b68sm772493066b.59.2025.06.10.12.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 12:22:12 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------jCef0Momx0KucmR7W7UrkGEG"
Message-ID: <68d38b0b-1666-4974-85d4-15575789c8d4@gmail.com>
Date: Tue, 10 Jun 2025 21:22:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 kuni1840@gmail.com, kuniyu@amazon.com, davem@davemloft.net,
 edumazet@google.com
Content-Language: en-US, pl
From: =?UTF-8?Q?Jacek_=C5=81uczak?= <difrost.kernel@gmail.com>
Subject: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
Cc: Mario Limonciello <mario.limonciello@amd.com>

This is a multi-part message in MIME format.
--------------jCef0Momx0KucmR7W7UrkGEG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

on 6.16-rc1 Hyprland (WM) crashes on start (more details in amdgpu issue 
tracker where I've originally reported that issue: 
https://gitlab.freedesktop.org/drm/amd/-/issues/4306). Bisection points 
to: [3f84d577b79d2fce8221244f2509734940609ca6] af_unix: Inherit sk_flags 
at connect(). -- log attached.

Reverting entire SO_PASSRIGHTS fixes the issue.

Regards,

-Jacek

--------------jCef0Momx0KucmR7W7UrkGEG
Content-Type: text/x-log; charset=UTF-8; name="hyprland-bisect.log"
Content-Disposition: attachment; filename="hyprland-bisect.log"
Content-Transfer-Encoding: base64

Z2l0IGJpc2VjdCBzdGFydCAnZHJpdmVycy9ncHUvZHJtL2FtZC8nCiMgc3RhdHVzOiB3YWl0
aW5nIGZvciBib3RoIGdvb2QgYW5kIGJhZCBjb21taXRzCiMgYmFkOiBbMTkyNzJiMzdhYTRm
ODNjYTUyYmRmOWMxNmQ1ZDgxYmRkMTM1NDQ5NF0gTGludXggNi4xNi1yYzEKZ2l0IGJpc2Vj
dCBiYWQgMTkyNzJiMzdhYTRmODNjYTUyYmRmOWMxNmQ1ZDgxYmRkMTM1NDQ5NAojIHN0YXR1
czogd2FpdGluZyBmb3IgZ29vZCBjb21taXQocyksIGJhZCBjb21taXQga25vd24KIyBnb29k
OiBbMGZmNDFkZjFjYjI2OGZjNjllNzAzYTA4YTU3ZWUxNGFlOTY3ZDBjYV0gTGludXggNi4x
NQpnaXQgYmlzZWN0IGdvb2QgMGZmNDFkZjFjYjI2OGZjNjllNzAzYTA4YTU3ZWUxNGFlOTY3
ZDBjYQojIGJhZDogWzFiOThmMzU3ZGFkZDZlYTYxM2E0MzVmYmFlZjFhNWRkN2IzNWZkMjFd
IE1lcmdlIHRhZyAnbmV0LW5leHQtNi4xNicgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L25ldGRldi9uZXQtbmV4dApnaXQgYmlzZWN0IGJhZCAx
Yjk4ZjM1N2RhZGQ2ZWE2MTNhNDM1ZmJhZWYxYTVkZDdiMzVmZDIxCiMgZ29vZDogW2E2MWUy
NjAzODE0MzcyN2Q5YjBmMWJjMDFiMDM3MGY3N2YyYWQ3ZTRdIE1lcmdlIHRhZyAnbWVkaWEv
djYuMTYtMScgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L21jaGVoYWIvbGludXgtbWVkaWEKZ2l0IGJpc2VjdCBnb29kIGE2MWUyNjAzODE0Mzcy
N2Q5YjBmMWJjMDFiMDM3MGY3N2YyYWQ3ZTQKIyBnb29kOiBbYmJmZjI3YjU0ZTQyNzFhNDJl
YTFkYmE5M2E3NmU1MTE2NWYyZGJhYV0gTWVyZ2UgdGFnICduaW9zMl91cGRhdGVzX2Zvcl92
Ni4xNicgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2Rpbmd1eWVuL2xpbnV4CmdpdCBiaXNlY3QgZ29vZCBiYmZmMjdiNTRlNDI3MWE0MmVhMWRi
YTkzYTc2ZTUxMTY1ZjJkYmFhCiMgZ29vZDogW2UzOWQxNGE3NjBjMDM5YWYwNjUzZTNkZjk2
N2U3NTI1NDEzOTI0YTBdIG5ldDogZHNhOiBiNTM6IGltcGxlbWVudCBzZXR0aW5nIGFnZWlu
ZyB0aW1lCmdpdCBiaXNlY3QgZ29vZCBlMzlkMTRhNzYwYzAzOWFmMDY1M2UzZGY5NjdlNzUy
NTQxMzkyNGEwCiMgZ29vZDogW2VkNzM3MjhmZDE0ZTE0NzE0YTg2YjQ4MjZmYjcxMTVkOWRh
ZGUxYjZdIE1lcmdlIHRhZyAnbXQ3Ni1uZXh0LTIwMjUtMDUtMjEnIG9mIGh0dHBzOi8vZ2l0
aHViLmNvbS9uYmQxNjgvd2lyZWxlc3MKZ2l0IGJpc2VjdCBnb29kIGVkNzM3MjhmZDE0ZTE0
NzE0YTg2YjQ4MjZmYjcxMTVkOWRhZGUxYjYKIyBiYWQ6IFtiYjkxZjc1NDdmNzk0MzRlODgx
OGQzZjIzNTQzN2UwMjFkMzRjMWNiXSBvY3Rlb250eDItYWY6IE5QQzogQ2xlYXIgVW5pY2Fz
dCBydWxlIG9uIG5peGxmIGRldGFjaApnaXQgYmlzZWN0IGJhZCBiYjkxZjc1NDdmNzk0MzRl
ODgxOGQzZjIzNTQzN2UwMjFkMzRjMWNiCiMgZ29vZDogW2M2YTk1N2QwNjc5MTJmMWFiNGUz
YmU0YzkyZDM3MzBjMjFkMWRkYjhdIHNlbGZ0ZXN0czogZHJ2LW5ldDogRml4ICJlbnZpcm5v
bWVudHMiIHRvICJlbnZpcm9ubWVudHMiCmdpdCBiaXNlY3QgZ29vZCBjNmE5NTdkMDY3OTEy
ZjFhYjRlM2JlNGM5MmQzNzMwYzIxZDFkZGI4CiMgZ29vZDogW2VhNjM0MmQ5ODkyOGUyNDNm
MjAyNGZiOTdhOWI0ZDQyZWU1NWRmYmFdIG5ldDogYWRkIHNrYl9jb3B5X2FuZF9jcmMzMmNf
ZGF0YWdyYW1faXRlcigpCmdpdCBiaXNlY3QgZ29vZCBlYTYzNDJkOTg5MjhlMjQzZjIwMjRm
Yjk3YTliNGQ0MmVlNTVkZmJhCiMgZ29vZDogWzMzZTFiMWIzOTkxYmE4YzBkMDJiMjMyNGE1
ODJlMDg0MjcyMjA1ZDZdIE1lcmdlIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9uZXRkZXYvbmV0CmdpdCBiaXNlY3QgZ29vZCAzM2UxYjFiMzk5MWJh
OGMwZDAyYjIzMjRhNTgyZTA4NDI3MjIwNWQ2CiMgZ29vZDogWzIzMjA1NTYyZmZjOGRlMjBm
NTdhZmRkOTg0ODU4Y2FiMjllNzc5NjhdIEJsdWV0b290aDogc2VwYXJhdGUgQ0lTX0xJTksg
YW5kIEJJU19MSU5LIGxpbmsgdHlwZXMKZ2l0IGJpc2VjdCBnb29kIDIzMjA1NTYyZmZjOGRl
MjBmNTdhZmRkOTg0ODU4Y2FiMjllNzc5NjgKIyBnb29kOiBbMzA0MWJiYmViNDFiODA3ZDJl
MjRkN2Q3OGQ5Y2MxMzg3ZDk1ODk4YV0gYWZfdW5peDogRG9uJ3QgcGFzcyBzdHJ1Y3Qgc29j
a2V0IHRvIG1heWJlX2FkZF9jcmVkcygpLgpnaXQgYmlzZWN0IGdvb2QgMzA0MWJiYmViNDFi
ODA3ZDJlMjRkN2Q3OGQ5Y2MxMzg3ZDk1ODk4YQojIGdvb2Q6IFswZTgxY2ZkOTcxZGM0ODMz
YzY5OWRjZDg5MjRlNTRhNTAyMWJjNGU4XSBhZl91bml4OiBNb3ZlIFNPQ0tfUEFTU3tDUkVE
LFBJREZELFNFQ30gdG8gc3RydWN0IHNvY2suCmdpdCBiaXNlY3QgZ29vZCAwZTgxY2ZkOTcx
ZGM0ODMzYzY5OWRjZDg5MjRlNTRhNTAyMWJjNGU4CiMgYmFkOiBbNzdjYmUxYTZkODczMGEw
N2Y5OWY5MjYzYzJkNWYyMzA0Y2Y1ZTgzMF0gYWZfdW5peDogSW50cm9kdWNlIFNPX1BBU1NS
SUdIVFMuCmdpdCBiaXNlY3QgYmFkIDc3Y2JlMWE2ZDg3MzBhMDdmOTlmOTI2M2MyZDVmMjMw
NGNmNWU4MzAKIyBiYWQ6IFszZjg0ZDU3N2I3OWQyZmNlODIyMTI0NGYyNTA5NzM0OTQwNjA5
Y2E2XSBhZl91bml4OiBJbmhlcml0IHNrX2ZsYWdzIGF0IGNvbm5lY3QoKS4KZ2l0IGJpc2Vj
dCBiYWQgM2Y4NGQ1NzdiNzlkMmZjZTgyMjEyNDRmMjUwOTczNDk0MDYwOWNhNgojIGZpcnN0
IGJhZCBjb21taXQ6IFszZjg0ZDU3N2I3OWQyZmNlODIyMTI0NGYyNTA5NzM0OTQwNjA5Y2E2
XSBhZl91bml4OiBJbmhlcml0IHNrX2ZsYWdzIGF0IGNvbm5lY3QoKS4K

--------------jCef0Momx0KucmR7W7UrkGEG--
