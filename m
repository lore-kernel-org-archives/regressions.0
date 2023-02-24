Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F2B197
	for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 17:20:07 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id v10so3927579iox.8
        for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nruIHAhdhx1kLlG3LLxcyHw+CS76kCYQby15s3Fp+Y=;
        b=IpamoNkd4cXS1VDYI2n56rf2X4LcZBHRzlXw71mavaB4o/VFmHAPvqlcZBuuuyV2T1
         05SYpOUK/2Krm7rHdTiL9hszzpkwhMaHwREFeoCxZDiu/7vSq9glnbo1J6CDZ2V75RXK
         t1J43Ybp020bq2DdNo+xb3PUyGlYbzpQPXPBFIg41mclgJSXAz0F1EuKNkh8vMfaRFDc
         nR4WtHnvEgd81QKrw8ZajY8oeBY4YtONuZz9GL767Kba+KyBik0g4KcrIAVC944Efz6s
         EWhMHWpF1Er7YuhqmHlWCQbU/TiX+5DkGKVhvE8EaW8q7eu65HkAJ3/b7v3Bo/A/E8kV
         dBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nruIHAhdhx1kLlG3LLxcyHw+CS76kCYQby15s3Fp+Y=;
        b=6UX3iXRnpQXznvVdXjWcTLl4bsfeJBctx0cJ28QSAPzJc+ULTp08YJHEfoH/B1i/NZ
         satP0gTLgqvXPN6qnW/rROcrffo9tB92hhK2bc069nS+vWjCKhBgBDxulHOQmX9hfIA6
         nEDb/NxXcS45TPzq36jYP6p5Z3Y09VX3V+KLsFMvcowem9kheMXJHr+KX7izgpk+frQp
         SbbxvpJCQ65afxi0aAFue7fuA739oFCq6uKPU0cdRp5YR8iU4k2hBsOtl3zOOBthLYOO
         DPrTtf8O4mNUKajnGkTC1Aoo/4bRqHr22QrSdzpwydrl3+HGIS+dmed3YhHKx/0oxXUT
         smAw==
X-Gm-Message-State: AO0yUKVSjys6OhfDKwFOLcU+ZKxs3N3imZlPpKpMw4bJJYf6bR0UfV0C
	2P01pyDHe8+HiGywKMdK5Jg=
X-Google-Smtp-Source: AK7set8NgV86UQeUeidAd60E4SLLlduW3eN2qKkqFJEQ/Lse8jHWimLTTUAnNOU966VV+v7wxtMv2A==
X-Received: by 2002:a5d:8e01:0:b0:74c:822c:a6ac with SMTP id e1-20020a5d8e01000000b0074c822ca6acmr9886755iod.15.1677259206469;
        Fri, 24 Feb 2023 09:20:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n9-20020a5e8c09000000b00740710c0a65sm3552788ioj.47.2023.02.24.09.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:20:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Feb 2023 09:20:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wei Fang <wei.fang@nxp.com>, Heiner Kallweit <hkallweit1@gmail.com>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Arun.Ramadoss@microchip.com,
	intel-wired-lan@lists.osuosl.org, regressions@lists.linux.dev
Subject: Re: [PATCH net-next v8 6/9] net: phy: c22: migrate to
 genphy_c45_write_eee_adv()
Message-ID: <20230224172004.GA1224760@roeck-us.net>
References: <20230211074113.2782508-1-o.rempel@pengutronix.de>
 <20230211074113.2782508-7-o.rempel@pengutronix.de>
 <20230224035553.GA1089605@roeck-us.net>
 <20230224041604.GA1353778@roeck-us.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224041604.GA1353778@roeck-us.net>

Copying regzbot.
  
#regzbot ^introduced 9b01c885be36
#regzbot title Network interface initialization failures on xtensa, arm:cubieboard
#regzbot ignore-activity

On Thu, Feb 23, 2023 at 08:16:06PM -0800, Guenter Roeck wrote:
> On Thu, Feb 23, 2023 at 07:55:55PM -0800, Guenter Roeck wrote:
> > On Sat, Feb 11, 2023 at 08:41:10AM +0100, Oleksij Rempel wrote:
> > > Migrate from genphy_config_eee_advert() to genphy_c45_write_eee_adv().
> > > 
> > > It should work as before except write operation to the EEE adv registers
> > > will be done only if some EEE abilities was detected.
> > > 
> > > If some driver will have a regression, related driver should provide own
> > > .get_features callback. See micrel.c:ksz9477_get_features() as example.
> > > 
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > 
> > This patch causes network interface failures with all my xtensa qemu
> > emulations. Reverting it fixes the problem. Bisect log is attached
> > for reference.
> > 
> 
> Also affected are arm:cubieboard emulations, with same symptom.
> arm:bletchley-bmc emulations crash. In both cases, reverting this patch
> fixes the problem.
> 
> Guenter
