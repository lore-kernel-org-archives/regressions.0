Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79243A945
	for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 11:07:57 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so85553801fa.3
        for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689678475; x=1692270475;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhj3PiKMKBo2rj4GQa0g6ssdckgN6WqVltudoi3R9Dw=;
        b=GWQ34gLkK245it+cwSvu3Ac8nmFBe2xgCQaHMcS8RiAuRql1eerVgVcGo6a4vYwA4e
         +ZNXy8BgEU9hlTqinfpGscLovv5L0IEzg8hvMqh3Gix4GveJZzotAQFIZ/f+Z5F/SB6D
         7qdvCYd3F5ZMTJSxFP5rB8X3y/debR7h0SzqfIDRUp/fI8owYhSJUlKiPs33/kNXK8Nb
         MLc4xlaYyhMvkofWSDFA/EayKCwFmwGH/XoMDOiBGfbmC+crmgVGnYORes6b6hDMlxHc
         lGQswj3h9Aiz2qqiKghC3thNMQ1rkHL26Qh5R1TQxyH0dyfr/mps+8+OFUlPmbDBkXef
         X+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689678475; x=1692270475;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bhj3PiKMKBo2rj4GQa0g6ssdckgN6WqVltudoi3R9Dw=;
        b=e7lyV+HXiQb2sgj/2oP5rkp3NK19zKulL5XGozal+UGSIQ0BvPUxAkf/sbkWa7nLyt
         dgw8E/rM74YS+DLyawxnDuo2eNucGuvIoM/Zko1OOA6NaDEJMc3vWwxNrd1ebldTfb6p
         8DB7/SnlVOjLg3kcQbN2CC+0KpLOkq7TtBXZQ82rKu1pxVCLEZ1M8Kp5pg2U5+/FKrzR
         wNIBMFbaSldj4Wrt2mjoFa3i0O8OzGXd2MhZHJQvCA04biQLDtliv00OrkJz4YK29XBM
         RWekDYs7uP4msMOJItwEpz8T+fbetZOJwR12kqdXJS+uR2wBr68eUbKny8Jr1k49L468
         Prpw==
X-Gm-Message-State: ABy/qLbPTFAzHGW/7btVAlMEigsDlgGbOjBw8jdwifQU4oR+CgohV80s
	RPZhjQxT51ffIcUA8AILL9g=
X-Google-Smtp-Source: APBJJlHSqwCqJQ7z2SS7mSIwUB16zJ2uJQ7aX7yFGLbJCoUQQB21Vh2OhQEO/byaSPyN3TUsuDDWdw==
X-Received: by 2002:a2e:b019:0:b0:2b9:20fe:4bcc with SMTP id y25-20020a2eb019000000b002b920fe4bccmr6508949ljk.21.1689678474893;
        Tue, 18 Jul 2023 04:07:54 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7315:d100:15fd:b3ca:86:923? (dynamic-2a01-0c22-7315-d100-15fd-b3ca-0086-0923.c22.pool.telefonica.de. [2a01:c22:7315:d100:15fd:b3ca:86:923])
        by smtp.googlemail.com with ESMTPSA id h5-20020a50ed85000000b00521a7864e13sm964956edr.90.2023.07.18.04.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:07:54 -0700 (PDT)
Message-ID: <ddadceae-19c9-81b8-47b5-a4ff85e2563a@gmail.com>
Date: Tue, 18 Jul 2023 13:07:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net 0/2] r8169: revert two changes that caused regressions
To: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This reverts two changes that caused regressions.

Heiner Kallweit (2):
  r8169: revert 2ab19de62d67 ("r8169: remove ASPM restrictions now that
    ASPM is disabled during NAPI poll")
  Revert "r8169: disable ASPM during NAPI poll"

 drivers/net/ethernet/realtek/r8169_main.c | 38 ++++++++++++++++-------
 1 file changed, 27 insertions(+), 11 deletions(-)

-- 
2.41.0

