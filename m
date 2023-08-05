Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E701FDD
	for <regressions@lists.linux.dev>; Sat,  5 Aug 2023 07:34:25 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76af2cb7404so216465585a.0
        for <regressions@lists.linux.dev>; Sat, 05 Aug 2023 00:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20221208.gappssmtp.com; s=20221208; t=1691220864; x=1691825664;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w9uyawjZHnUZYQY4bK5UiV75xekF3m7LclUMpvxGdxc=;
        b=wCv0jUGOVIW35mI2i0onFOjL9Al2wDEaZ/KD9WSeq5NKNGbb1wMiLuMCelEijDd8ks
         b/FqqTdu3JcCCSZ3kFYjihJ2Q9v8Xi17ycTrDKZIdFmyBgE2PldYgGQLabueL3GKs0v2
         8FoyKGM68aL7zQy24NAOmNYVR3roNK9kx6XbKe79IBPPej85xGu3GW1P+X6R4DqyWIya
         z1NF14oc1yIu3BZ6ZxdLUtSMqUWIXFUwJQ+wnWM62dQ819Ecb6HMq73Q2qCBSiM4ayha
         ouL0OMSp9pDup5pDmfIqplkDcVvGchtFBpLZe0iV9USwLpPtS7+oYhzYBGgfHAVFsb1F
         uK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691220864; x=1691825664;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9uyawjZHnUZYQY4bK5UiV75xekF3m7LclUMpvxGdxc=;
        b=TVQxXJSe0f5oqAS2RwaVhUT/Svln7RNx/QvTfPtOsJjzrhNP1Clq4bdxCJ9HfzLfoH
         ++kTiVlMXdk3wLjFmqb5I+IAucQpu2yflAs5lzZkDxgUlRl/TCDTI2WkMRLvPMbO4sVk
         viDwp9hG72dOCFCiHvJ0xLnPSaTXUT1YCSCLPzh+BvdQI80O3XPniJ7f6gPoxjYEdHvp
         1RSmCy4LtjsId9jFE+/VO2IUdSGhfquxI95hP82hT6sWhETPukM4YkLQnjX4C116H1qj
         S7G08/UyPLgXD6yLPuL294jkIjAh0Bj5IDUhKkkfreDpNzMk3JJhFGJFwVZV760912Rh
         19TQ==
X-Gm-Message-State: AOJu0YzE4CIUrUw06GUb8hLD1jSerpb38/xuZFgSvueQkHzYavEp2Ei8
	g4ixov9S5XE1UFirXFGHDJlIN7XvLOKDAno04tcaOg==
X-Google-Smtp-Source: AGHT+IFdYcostVh57kE1L1S3kadAFjg+9iFXDHE2FAEn7ZWsTWYXPzw41CWvawMnXI34J9XRxsLPlCDQgPGLl/MPP7c=
X-Received: by 2002:a05:620a:c47:b0:76c:97fd:c106 with SMTP id
 u7-20020a05620a0c4700b0076c97fdc106mr5134931qki.70.1691220863327; Sat, 05 Aug
 2023 00:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:6209:0:b0:794:1113:bb24 with HTTP; Sat, 5 Aug 2023
 00:34:22 -0700 (PDT)
X-Originating-IP: [24.53.241.2]
In-Reply-To: <c38e208b-4ffa-4310-ae00-412447fc4269@lunn.ch>
References: <CADyTPEzqf8oQAPSFRWJLxAhd-WE4fX2zdoe9Vu6V9hZMn1Yc8g@mail.gmail.com>
 <CAL_JsqLrErF__GGHfanRFCpfbOh6fvz4-aJv32h8OfDjUeZPSg@mail.gmail.com>
 <CADyTPEwgG0=R_b5DNBP0J0auDXu2BNTOwkSUFg-s7pLJUPC+Tg@mail.gmail.com>
 <CADyTPExgjcaUeKiR108geQhr0KwFC0A8qa_n_ST2RxhbSczomQ@mail.gmail.com>
 <CAL_Jsq+N2W0hVN7fUC1rxGL-Hw9B8eQvLgSwyQ3n41kqwDbxyg@mail.gmail.com>
 <CADyTPEyT4NJPrChtvtY=_GePZNeSDRAr9j3KRAk1hkjD=5+i8A@mail.gmail.com>
 <CAL_JsqKGAFtwB+TWc1yKAe_0M4BziEpFnApuWuR3h+Go_=djFg@mail.gmail.com>
 <CADyTPEwY4ydUKGtGNayf+iQSqRVBQncLiv0TpO9QivBVrmOc4g@mail.gmail.com>
 <173b1b67-7f5a-4e74-a2e7-5c70e57ecae5@lunn.ch> <CADyTPExypWjMW2PF0EfSFc+vvdzRtNEi_H0p3S-mw1BNWyq6VQ@mail.gmail.com>
 <c38e208b-4ffa-4310-ae00-412447fc4269@lunn.ch>
From: Nick Bowler <nbowler@draconx.ca>
Date: Sat, 5 Aug 2023 03:34:22 -0400
Message-ID: <CADyTPEyQcHd5-A2TLf_-U5KdtA5WKZ_mNYKvx3DSMjkNi99E0g@mail.gmail.com>
Subject: Re: PROBLEM: Broken or delayed ethernet on Xilinx ZCU104 since 5.18 (regression)
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On 2023-08-05, Andrew Lunn <andrew@lunn.ch> wrote:
>> > It was also commented out before that change. It could be that gpio
>> > controller is missing. Do you have the driver for the tca6416 in
>> > your kernel configuration?
>>
>> I have CONFIG_GPIO_PCA953X=y which I think is the correct driver?
>
> It does appear to be the correct driver. But check if it has
> loaded. It is an i2c device, so maybe you are missing the I2C bus
> master device?

That's it!  I needed to set

  CONFIG_I2C_CADENCE=y

and now things are working again!

Thanks,
  Nick
