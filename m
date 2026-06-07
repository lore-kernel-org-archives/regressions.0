Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14123128D4
	for <regressions@lists.linux.dev>; Sun,  7 Jun 2026 22:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780873147; cv=none; b=TnU39NLsG/dEXqqSjTQg9xBgEXWMomgxJIn87CsBRoWJT0pA1gQkkhCVX34FA9yZUYlm6EAp0+NTTqS0OwbU2MYRupu2Id7nAnqYz0GunPFWOVoMPDy1hYw1LvrotC/R3k7dwjEEcNW9JsPG/6sOdw0fsb601LhSa6FJqPwruPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780873147; c=relaxed/simple;
	bh=cfocYRwzijt7Nsnz2DHKCAaHtlZuZ0wai49c+cNlqDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXB9nLt8dw3nnegWjK8SuGuexy+hRQRhIX6nJEVLpzlcRUVWezv2qZvH7TOf/PM6k6qmH1uUgveKHdtHcITdyv2MGsmfmQvDuzqDeAtcWu9WNOQ6vO/pyziaYGvU5JYWrqv799HBGHmVWHJm+OLTqAdtD6DTkAKe8zdehve7fvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8rNKtuw; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8rNKtuw"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8cceb2ecc03so32614686d6.3
        for <regressions@lists.linux.dev>; Sun, 07 Jun 2026 15:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780873145; x=1781477945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cb3sWf+RWoizgQv6BHRmquqe3oZdi3qwiZN/K5InEJc=;
        b=g8rNKtuwPSOwJ1oExQ/7eaHkufk/4XeKENf9+26LxcqL72AqFN5aXz+nEQoYrGS9jD
         udzPjJ1+8ewvys7cEqPg/no9ZzwWxjlMZbXHWpMyqLIgUuzD64nTgudilxxMHGIeKW9u
         h9/f1ZbdXwWeo8wEEeVyxCgXb+S5th7Z3dYCrRUKukN3hKGjTn60cyQyVSvoVB49iGui
         RjxldEGR6oZcCJWJ6GMi2Sj7QnuHT8+jtT4etsXmCuzutpuurNN0HlVAHG5oS5timdhz
         GdKLY3Z8Kff5FDOTR/pYkSWQ679eN2jA+Y1qMYY07RaP0FIo/6XrYTLagTj/bWIS9lVT
         6b7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780873145; x=1781477945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb3sWf+RWoizgQv6BHRmquqe3oZdi3qwiZN/K5InEJc=;
        b=YpbUzpp2JELbr64slMfZVPv8dbiYTSj9FMgoB1ydTvHNyufEoZ1FEyTZIdZQAgS42z
         XoTAlNhX0gRlXr/k5k+cCk799ykPGmLVBAI5qQoCsQsILQvv+RGfJctKb5+h2KWM45AB
         TXXeGqKtUQ0T459XAW/3KKt15f1PYREHAhmMGFgzVHA2tTduJHotoQYizBleLANJ99po
         Jgo+uB+zu6WCzs0mVxwsibVOrHsaNQV03crZivcnLbfUvbUM3Yk7PayOm6K3YtW6lyyZ
         i1J4OQEp2zwL7RvlCWacpA6w+2alKxrG3TIvJ6ClNF4om3XTrC6QiWMWkh0nBe/pCdS+
         MuVA==
X-Gm-Message-State: AOJu0YwfJjYSnK01ey5sTm9rggPPsgoQwUHaD6CRUxjdiQosaxfD+wk/
	US2tKEC+am1H/n0ncGKlHQk34jW/7zVZDsnb++6O7aViwq+d09wkc65w
X-Gm-Gg: Acq92OFYxDa8qUW9wO0BSj4tuu6G1OXvG966JrLcDfXv3moM15w7mdiTSFxw9uvyHSH
	pSOXVlIcpfI5qscHxRpQ8hfY8I+B19PqQ9hup+0U2DXAVS3L/ryqxdqTNybLBE+RYe0ARNtesT9
	ISHRIXBQ/Us9wztSgMWoSqY5LXMJvoLGuBJFpjVOX6lgSxrMtMBsv4Tr3Q/3UIVE/iAsn0iJTHf
	34sA6oiIXKmncXeGOoZazi1vHE2z2wS0IrgYnfKICofCwwf/OIv57pjS1t5+jihcLuvC7O1ffTe
	oMXYTjDIHt7nx9Wiub9KKK/+eAPyBGaPYeA2UqnW8b5yed/3QS1InPrIs8hgSYIxDTiJfILQqTy
	e3ni7feeA95bzpcE4FZekobux6uYfZS75TZKvNSmdxyFwH1mkeojQYRNo+ksjDYCCcGLGdpu6yZ
	HnsbODYbzQcsx8KbaYjfUCVSQOR3xfDFEiu9rj6WcJQnmXxI3up9RyzOAeuskZ6lMcFiqfDYnzR
	o9Wr5xbjtdqeZVVkcbl8yg=
X-Received: by 2002:a05:6214:54c7:b0:8cc:e14:9594 with SMTP id 6a1803df08f44-8cee6268478mr195954696d6.33.1780873144834;
        Sun, 07 Jun 2026 15:59:04 -0700 (PDT)
Received: from oklopfer.hsd1.ma.comcast.net (c-73-167-46-184.hsd1.ma.comcast.net. [73.167.46.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda2601sm144816226d6.6.2026.06.07.15.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 15:59:04 -0700 (PDT)
From: Oren Klopfer <oklopfer37@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: regressions@lists.linux.dev,
	pbrobinson@gmail.com,
	heiko@sntech.de,
	guptarud@gmail.com,
	megi@xff.cz
Subject: [REGRESSION][BISECTED] wireless networking broken on Pinephone Pro
Date: Sun,  7 Jun 2026 18:59:01 -0400
Message-ID: <20260607225901.64019-1-oklopfer37@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies if this is not formatted properly, this is my first submission to the kernel mailing list. WiFi specifications were introduced into the Pinephone Pro device tree in 096bd8c679185f898cae9933c6a68650fa26ea4f, but this causes complete networking failure on some devices. The regression affects all versions v6.18-rc1..v7.1-rc6.

An identical issue was reported for the Pinebook Pro at https://lore.kernel.org/all/aUKOlj-RvTYlrpiS@rock.grzadka/; the regression was reverted in 29d1f56c4f3001b7f547123e0a307c009ac717f8. The errors faced on the Pinephone Pro are exactly the same as were reported for the Pinebook Pro regression.

A previous patch at https://lore.kernel.org/all/20260112-ppp_connectivity-v1-3-284d6e83b212@gmail.com/ attempted to resolve this issue but never ended up being merged.

Bisection:
096bd8c679185f898cae9933c6a68650fa26ea4f is the first bad commit
commit 096bd8c679185f898cae9933c6a68650fa26ea4f
Author: Peter Robinson <pbrobinson@gmail.com>
Date:   Fri Aug 29 12:38:24 2025 +0100

    arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro
   
    Update the wake-up pin and associated interupt details for the
    Pinephone Pro WiFi module. Details obtained from the published
    PinephonePro-Schematic-V1.0-20211127.pdf page 19.
   
    Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
    Link: https://lore.kernel.org/r/20250829113826.2029755-1-pbrobinson@gmail.com
    Signed-off-by: Heiko Stuebner <heiko@sntech.de>

 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

Reverting the commit allows wireless connection to function again. I am not really familiar with the process of submitting a revert patch, but I'd request that this be done on all of 6.18 (LTS), 7.0 (Stable), 7.1 (Mainline). Thanks!

#regzbot introduced: 096bd8c679
