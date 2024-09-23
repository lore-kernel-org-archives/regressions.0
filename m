Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAB712E4D
	for <regressions@lists.linux.dev>; Mon, 23 Sep 2024 06:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727073276; cv=none; b=UZlq9zqv++Vt6N5Pc3wzArZuTTjp5OLzeskM0IVyvKfhEF7xCzQOE2itm7SV0vEoLGsp+hZ/4+UupRcBOa82YCw2vnrew5M5taJP+VJIFELHnP1QjqeF8HzSiXZnKJFjX1T+qHmsE0NkSNEBX9swD8Dmhyk9SIR5G05KdwVqMKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727073276; c=relaxed/simple;
	bh=figRSM5uwXBz+DqKm9Y8ViKtaULHMXexiRKciLKh50s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AU1yoikZ+CBgU0fDNT1YjnDrdxQsKir2iYRCpH7MW1PIQ5zXvtOaecMV5mJT0/uTP8A08rNLn9l6zdmH2Ktt8R/ZJnQVDvOhtiBu0x1gFpkNxki4fQY6RF7sPFgDN2bynGfdUfo0SoHAFB8Kkd6fv3YBV2sBgtHnzcHVUMPwBtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fstab.de; spf=pass smtp.mailfrom=fstab.de; dkim=pass (2048-bit key) header.d=fstab.de header.i=@fstab.de header.b=N7/gWG7D; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fstab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fstab.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fstab.de header.i=@fstab.de header.b="N7/gWG7D"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6c358b725feso28291166d6.1
        for <regressions@lists.linux.dev>; Sun, 22 Sep 2024 23:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fstab.de; s=google; t=1727073274; x=1727678074; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=figRSM5uwXBz+DqKm9Y8ViKtaULHMXexiRKciLKh50s=;
        b=N7/gWG7DAHOwJXbtlzuj5t0JOIbpRmun1MLwy7sHZVelUl9tCbDwkntfDEh87SzrTn
         2Weg+1JBVgORUCnW0ZibdO7G6b3Bf7suxGSQTZf/VnyogOgQ2SBYQu9tx+lXYvb5nMEx
         QqjnCTH9ExxIDuOHqrZcSOcOOivuj4c2uFVcwgM8JKSlz2+4SOgHmU/DyeTWRC1hDKfy
         FD9R6vZdZs3wVe+5i9BK9WuK+AR6xVl8cljoziUixYw8nbdg+pHOjWQYoK2dvK+tBS1F
         ZF74pgNax8fTmr8GJpA4xP0pP7RHqHfLa+vOq0SA+Y1NPzKvP0Ea6RIUX+dGSJY/wCtm
         m7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727073274; x=1727678074;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=figRSM5uwXBz+DqKm9Y8ViKtaULHMXexiRKciLKh50s=;
        b=TqXJ7qVEJIxxMON+eM97VOas0MwLOrdMUT+3y1pokZ17fpacEr6sH9emOoqj3M2NJf
         x/8W6YrPOEfZz182G63mT++o1x6XvpiAqWpFnxYeUNriSeqz5AlvuhDR/0khX01W66SO
         cpLFi9+miePhYiuhoedXKQ7KypgJSEeIOXUh715PcaAuoeqQ4I0aHYLSib3SsYsKbqH6
         AWtnGb2DidJ0/5XUaqbjubGg0BR3sPqKQyPAdCCgjjDzNxpeyqSrmVB65NiDNLHo7mAB
         HHKZN35mJSca0eoRPxWCqfDMQSEyh1P7nmIKMfyLQXJPGXeM1Xf67Iv//rhUNbwJPAqg
         OQkg==
X-Gm-Message-State: AOJu0Yx2/3ckccUhKKTJ2XEeS+KdDGBg98MpdMD8kcJpd74tXVqPVIuc
	IFpSi9PvED3+oeveQYacxvgATCK4vYhmpGiC/rbtTBycK5ZfudC9vEmO4Tbn8elz0JRhojciFvD
	KQhrfAf8amGTZjVupOKhPAQ6/jN9f14bfAN90RQ==
X-Google-Smtp-Source: AGHT+IEe0Zy6MhQISPBXaDCPM/WYVBEi1fTtVz5ghNsYw9MwlfuQwCVE1xCje7qKRKsBXQR+uJ9+UZLjDvO/To1/kLY=
X-Received: by 2002:a05:6214:2f8f:b0:6c7:c650:962b with SMTP id
 6a1803df08f44-6c7c650966dmr131212646d6.51.1727073274090; Sun, 22 Sep 2024
 23:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Fabian_St=C3=A4ber?= <fabian@fstab.de>
Date: Mon, 23 Sep 2024 08:34:23 +0200
Message-ID: <CAPX310gmJeYhE2C6-==rKSDh6wAmoR8R5-pjEOgYD3AP+Si+0w@mail.gmail.com>
Subject: Dell WD19TB Thunderbolt Dock not working with kernel > 6.6.28-1
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I got a Dell WD19TBS Thunderbolt Dock, and it has been working with
Linux for years without issues. However, updating to
linux-lts-6.6.29-1 or newer breaks the USB ports on my Dock. Using the
latest non-LTS kernel doesn't help, it also breaks the USB ports.

Downgrading the kernel to linux-lts-6.6.28-1 works. This is the last
working version.

I opened a thread on the Arch Linux forum
https://bbs.archlinux.org/viewtopic.php?id=299604 with some dmesg
output. However, it sounds like this is a regression in the Linux
kernel, so I'm posting this here as well.

Let me know if you need any more info.

Thanks a lot

Fabian
