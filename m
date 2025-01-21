Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA0B3D68
	for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 04:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737435200; cv=none; b=KJUPegyju/Iw6DE4rLTwOzWoUFJA1eqQQXOvA/yhpnHuMNEaZDY/hGB5PufignBxWipiSk6vI6lDyeh9gDlkDlO7+V08iHomoj+wasg7qXmzIobwuAzNM2SwMvr67SkEchd1cm8hBY8fYzyM/JLOySWQK6wgkWD6gVW6ZRjdF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737435200; c=relaxed/simple;
	bh=X+O8DDbzBtjzpox+koeeDac6d6MNWDTtYL7qjF4qdV8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Q+UKRIWQqn9AN8owwlMdThuRcA8oZd3OivpDPyBxwBfnQzuFok+9XtdY290hZVyZctKOfT67V32CaRJ7lqHRZebemuR0XNGXJPC9cfbLoPRBb9qMwzND5yBoQPq+MsXaAYNh1BlN78bVQmDcmN04j/fMmRalWk+WV2RQHqQFvGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiGDzGb1; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiGDzGb1"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5160f80e652so1367040e0c.2
        for <regressions@lists.linux.dev>; Mon, 20 Jan 2025 20:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737435196; x=1738039996; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X+O8DDbzBtjzpox+koeeDac6d6MNWDTtYL7qjF4qdV8=;
        b=GiGDzGb1W8gzF7L2iP7DnHOD97ipXUcS2XUgweMn31iHQjl0G+sDsrx/7ftiOI5jOy
         +VB5IN1+MCWkpX1S0nS/UCGXGFeI9KBV1nTJg7fYVCNk8e80rTTI4W0vBBMXXpjeaoie
         NLBYZVcN640JDBWWMSO+VBv7zBeKu3J0gQhkohcBtOVHw0L8OAXOte+LS/z/BVQbVq22
         TcWQjjNRpxPgiwChsTqLjk5By7Q2CyIM8avqSKyZfL70hWZVPJBZvMZKKb0z0L8daibt
         9QQhwZdb7DYKRiREa1jKYZJ5ZrWcCK6zyY06+gWMf4AgluT2Uxi5ArXHcBs+eJ3qsNKh
         W4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737435196; x=1738039996;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+O8DDbzBtjzpox+koeeDac6d6MNWDTtYL7qjF4qdV8=;
        b=B5Z9TjuUg1d09dS9OcRu0AEvFvFJ2Un2oLUEZzl8C0FoR/X2BZzWYzPtdKAhdCzP0c
         0pb43SPEhLo5/h9xYQxeRmUWgAHa/QIjU20xvgHHh0vNjCwpuBhTQnPGD2c+4BEoWaJp
         +KB05sESFCwfVeBbLar8+qbj3S/Vz1l12GeDKWcAMwEc/QoUssjtphgA4y6XkmmM3B2P
         8b11yqdFOz3P3+KTFG9NZ+RdrFLT50ldD+q/650qYyEoaS+/QHSrZ+hN9NgKrxMjuh0p
         eubO8GdMC7+9trLl0PG+jem4KWprgFqRGES5V3vJhg4o6y0lxN+X+JeifKuDAjVLkAit
         e4nA==
X-Forwarded-Encrypted: i=1; AJvYcCVSlBiOAEAJCAogRzty4hWcmv/TlqwyeGzh1X8JsFTUTUk5ggBKXGjEm2wxxUIHfx9HiWzNAH34WDBfRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdtopzhG6lOHkaBgFSpFD2UHwngFXsslqJuYmE0NHZOCGrMUf9
	lOpINpfWRaXdmANQ9es4j4QvqITui4AImG2UGJBBKgiL5R3STWVTht8Yfm/c2S9WV6XNFcMZ8B+
	YTO1VqSmcgayFY/OcAKtvfdvN264=
X-Gm-Gg: ASbGncvadCeLLBsR7w/xexrXAhbbcFnKT6qkf+iUegJAECMmJFipFYEyrwBlp5alo1G
	AdzpLkSypTO+r549p0A7M9wYgiQTzrc2cWlcxMJX/Z0SmRD6scQ==
X-Google-Smtp-Source: AGHT+IF5e4RxDf/3lSSGVOyWX7VEZO9PZ2c89baHfSfBAz1QtzUHvvlyRehbsxBcJxAqae0gM00FTrBQjpGc05axmZw=
X-Received: by 2002:a05:6122:338b:b0:516:230b:eec with SMTP id
 71dfb90a1353d-51d5b265b25mr11982258e0c.5.1737435196447; Mon, 20 Jan 2025
 20:53:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Simon Kaegi <simon.kaegi@gmail.com>
Date: Mon, 20 Jan 2025 23:53:05 -0500
X-Gm-Features: AbW1kvY52NMdhNnCuLwEWyTpy5IPpTIJwa4s6ajou_UZAt_vLAbRecztOcnY4hI
Message-ID: <CACW2H-7QEMKA+LUAzFJ+srmRCzSuLk2G7shWt0SGR9SfmxwOjA@mail.gmail.com>
Subject: [REGRESSION] vsocket timeout with kata containers agent 3.10.1 and
 kernel 6.6.70
To: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Martin KaFai Lau <kafai@fb.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced v6.6.69..v6.6.70
#regzbot introduced: ad91a2dacbf8c26a446658cdd55e8324dfeff1e7

We hit this regression when updating our guest vm kernel from 6.6.69
to 6.6.70 -- bisecting, this problem was introduced in
ad91a2dacbf8c26a446658cdd55e8324dfeff1e7 -- net: restrict SO_REUSEPORT
to inet sockets

We're getting a timeout when trying to connect to the vsocket in the
guest VM when launching a kata containers 3.10.1 agent which
unsurprisingly ... uses a vsocket to communicate back to the host.

We updated this commit and added an additional sk_is_vsock check and
recompiled and this works correctly for us.
- if (valbool && !sk_is_inet(sk))
+ if (valbool && !(sk_is_inet(sk) || sk_is_vsock(sk)))

My understanding is limited here so I've added Stefano as he is likely
to better understand what makes sense here.

This commit was backported from v6.13 to v6.12.8..6.12.9.

-Simon
