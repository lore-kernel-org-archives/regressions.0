Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E1644C8C
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113721; cv=none; b=PAWMj7UgQGwBnVSyfqJL44V+F1xKo73Y/O0JOPTwMHeT6CefZ2X9csuY11ujJGvoXwtA4Vbn0d5KnleAZ32uzTA4ZJpyRUIpleaV7QlyqEIMn8HIffCoIxUY/TSHYCY0a+xhPU63hFbwjDJ8VmRVq6Tgw05B03kVnn4J7BSbpjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113721; c=relaxed/simple;
	bh=N5Rrw2MRuk1dzaCiuF3YDvfjUvsE9TiN6DdBtTtQZ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1qTv6wdizsGbeljo5/hf56xM9vFc4J1qEUwSNrfmBjeItrQujFfXfgUbed8gHNH+gQ7nuxIR9Q0aSUC6XZJF5bV9RWMNUFrpYW60LJlMJmiWfT7QvoUW1vZxYkBZ/oEjp5H9x4KOScspzFIYp3QT3/3rBvwfGO+Wu+nSBZZCaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MH7Sw6W+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MH7Sw6W+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42562e4b5d1so5740205e9.1
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 10:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113718; x=1720718518; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xbMuRw1sQkRSiFh279rXdYSfGjfdwITvelsunE8eQ+o=;
        b=MH7Sw6W+MkENuxm40pzLfYpX+1lthYJw2EWvUpfDJEJfXB/0fpIslcbN5ZwZVTrPtv
         s91VfApU32JBtnFilRCwE8zjFiQmATenXNXXtrPQ0dnAnOmQzgktTiGcvlLxB7ey5Uep
         POtyp3DdPxaDfQIobIqBGubF+5qJGoaOnng5D7ZCO+jAorjjN2RuECMRCcDC26l1YM0M
         DE23c4P+euAt5wlk7mwP7yvQ84QME6xiJHuzu9hf8ptEFrWwcPpP3LUJK/SizXamC1ym
         JKz8ORQDdvMqhuiFPWGJl3Bjhy2H49obtVTPkF+SdkXKHX9Dttz/12z904EKQzHlVdm+
         9YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113718; x=1720718518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbMuRw1sQkRSiFh279rXdYSfGjfdwITvelsunE8eQ+o=;
        b=bgExx1M0eoZeoKnVbnehKAOES+J8iDf2Wuzpsx51chmHJq7L5Ft/CiL6bluG4p4j02
         vkY+XXLN7oqW7m/AmveVhyjoGvpTP9nVSfTseQBksJ/GahEAOgfedulQy9FXh8hbLyAP
         HR068zYoBaifAecvFxnf6Yo452JFvu4weSsYJSAINkqg181b+jqmu6e1vc23ht/RM5qP
         G5M5ISdSUnzgZMsIDaIeGpbFECtPME04ytuQa/8486yyV9ZLVftrCfhIDPDmcmIVmA0H
         8NshncAIJITUds0WzpPVH3GbPV44F9BrVmOFJg6W40Yau9kPY8PYXztltfz37KMkipS1
         mjyg==
X-Forwarded-Encrypted: i=1; AJvYcCW+PsLxsqOIOq46GifP6UY5Geq7STMxCjyS5In4O9wAWblTkyy2ttsoB3YmC6myo7ofQLSXfQ0tUldkXjRw/5Qlk6aZB35YgWEktIY=
X-Gm-Message-State: AOJu0YyHoTM82UTVpCyaKuAfy0gxGZtva/rFVuosJgse1D/31zczx5il
	7/vQaF7umuW2FHNYWBhYVLE4M4Ug/wKXCD+xJctyNuv83MdLRsiX
X-Google-Smtp-Source: AGHT+IGdluLbnk0hTBC/jWbHuttDDQoIzwdZNIhKDlVq3XycWj2L2MDyVC25gNmwdtGq+W6484Ov3g==
X-Received: by 2002:adf:e94a:0:b0:367:88c2:23a5 with SMTP id ffacd0b85a97d-3679dd2b344mr1283829f8f.27.1720113717962;
        Thu, 04 Jul 2024 10:21:57 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367947ddebfsm4574672f8f.34.2024.07.04.10.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:21:57 -0700 (PDT)
Date: Thu, 4 Jul 2024 20:21:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <20240704172154.opqyrv2mfgbxj7ce@skbuf>
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
 <d3ac5584-8e52-46e0-b690-ad5faa1ede61@arinc9.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3ac5584-8e52-46e0-b690-ad5faa1ede61@arinc9.com>

On Wed, Jul 03, 2024 at 10:03:09AM +0300, Arınç ÜNAL wrote:
> Works on standalone MT7530, MT7621's MCM MT7530, and MT7531. From MT7621's
> MCM MT7530:
> 
> [    1.357287] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module

Why is the device corresponding to the first print located at address 1f,
then 0?

> [    1.364065] mt7530-mdio mdio-bus:00: [Firmware Warn]: impossible switch MDIO address in device tree, assuming 31
> [    1.374303] mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -14
> [...]
> [    1.448370] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module
> [    1.477676] mt7530-mdio mdio-bus:1f: configuring for fixed/rgmii link mode
> [    1.485687] mt7530-mdio mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
> [    1.493480] mt7530-mdio mdio-bus:1f: configuring for fixed/trgmii link mode
> [    1.502680] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=17)
> [    1.513620] mt7530-mdio mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
> [    1.519671] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=18)
> [    1.533072] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=19)
> [    1.545042] mt7530-mdio mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=20)
> [    1.557031] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=21)
