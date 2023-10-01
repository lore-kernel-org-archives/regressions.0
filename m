Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061619450
	for <regressions@lists.linux.dev>; Sun,  1 Oct 2023 05:53:34 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6c615df24c0so4466677a34.1
        for <regressions@lists.linux.dev>; Sat, 30 Sep 2023 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696139614; x=1696744414; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePzrbSK5zIWLB/POBpdNRqPyVo624yH+IKEEXcTja4A=;
        b=KChHhq+d9Yxf03y4/NRtfrx0qFRSaB49g2cJZu/KXQkBD+pGnkDG4KCup9MBsL2VXo
         zBG1P+oNlgybhnodPTYgYJYuAWmMi/8QvVKohyWuGaisD26Xf/rG0IoOszhwWQwv86yT
         1uYJdKOABV5R7ONN6RyRwyhi5Ltpw61kve3czV5VJA41Wdy4PHQwRhOQ3WiHpCozaL/p
         0DHe8Sz4KHVLtgZ9o7WXs9k4C1xjknf4GKTWhNm9KDLiZBe3RIUbPbEq+Ixqk5EIaz6C
         FXThiRqS6nvVKlWFM5Rvhj4Wab4wDDsZfxVUFFT77otXqhq6NFpOsyJk+eEqNbhy7SjQ
         HDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696139614; x=1696744414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePzrbSK5zIWLB/POBpdNRqPyVo624yH+IKEEXcTja4A=;
        b=pjGuXlmcyPFNZIIHde/WoCoNb5SuCfVfq20/GyeE/rnSG7P9Guv6xWvXLiXE8L9ypA
         8LucvvJLRZ3xwWKhnUyn7x3NqpGfdWqB0rH/4fRiQbOUkJakZnf+yU0oNWoxGuupbeVs
         MyMt5QpoC+3Q4HgN/+uzPFEzBukD0u18w7trYSXKJ0xAoAKp6oXU9B7dGhynx6B3p9zD
         9WvdmQoXinqealgiXdPJTnZtCzOPlIWsNz9HWi+R5eczUUFiJeHDgBUglMdPFervzALw
         dUFNBPyMZKIEtpVWMyx3qbsaVdalzUradUUEqtMr3T6mGmVOghHGvU5Q1mA26EvLDtV+
         IECg==
X-Gm-Message-State: AOJu0YzU5SeWEbDiR7ENlSgbntB3h0K1eh/Uku0DU+bZEshL5A2npgKB
	9oK9D4D3dVlk+f+Xjl9HZWk=
X-Google-Smtp-Source: AGHT+IFdgLbyqA1IdKObOtUzDGkBSktGTpC4TDWsdy0Y5ilnYn/s05Yx9ZCg7ChzNCeroywcu2oUXQ==
X-Received: by 2002:a05:6358:1ca:b0:14a:e8af:1227 with SMTP id e10-20020a05635801ca00b0014ae8af1227mr9156051rwa.22.1696139613846;
        Sat, 30 Sep 2023 22:53:33 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 9-20020a17090a018900b002772faee740sm4492143pjc.5.2023.09.30.22.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 22:53:33 -0700 (PDT)
Message-ID: <3d246a72-2755-484f-8274-0c61fc185592@gmail.com>
Date: Sun, 1 Oct 2023 12:53:22 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rt8000usb driver issue (maybe interaction with other drivers)
To: enc0der <enc0der@gmail.com>
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux USB <linux-usb@vger.kernel.org>, Linux RCU <rcu@vger.kernel.org>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Helmut Schaa
 <helmut.schaa@googlemail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hayes Wang <hayeswang@realtek.com>,
 Simon Horman <horms@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Andrew Gaul <gaul@gaul.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>
References: <CAEXpi5Rd6Y4umKOWRsCjX0kit=W5ZrVhn=MuRkyvJPwmjjDVnA@mail.gmail.com>
 <ZRj_ovMi-Xbb8i-D@debian.me>
 <CAEXpi5RiLbma5cb-ctEvvb7LGRn78VTOh5HDmreC2hYgtBEQog@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAEXpi5RiLbma5cb-ctEvvb7LGRn78VTOh5HDmreC2hYgtBEQog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2023 12:33, enc0der wrote:
> Hello Bagas,
> 
> The distro I am using is:
> Jetson Linux 35.4.1 which is is part of JetPack 5.1.2
> 
> Supported Linux Kernel version: 5.10 LTS
> aarch64
> sample root fs built from: Ubuntu 20.04
> 
> When I asked Nvidia directly, their response was "Most likely it could
> be wifi driver issue because it gives."
> 

So you have to report upstream here, right?

> These are the drivers being loaded:
> 
> rt2800usb              36864  0
> rt2x00usb              24576  1 rt2800usb
> rt2800lib             122880  1 rt2800usb
> rt2x00lib              77824  3 rt2800usb,rt2x00usb,rt2800lib
> mac80211              811008  3 rt2x00lib,rt2x00usb,rt2800lib
> cfg80211              724992  2 rt2x00lib,mac80211
> 

I don't see rt2800usb module in the mainline kernel. Is it out-of-tree?
(no wonder why it taints your kernel)

> I've not worked with driver code before, so I am out of my element
> here.  I saw in the git history for rt2800usb some changes went in
> since I was using the USB wifi adapter on an older system that has a
> linux version older than 2019 (when the OS was compiled and flashed on
> the machine).
> 

Where is the repo?

Last but not least, please don't top-post; reply inline with appropriate
context instead.

Confused...

-- 
An old man doll... just what I always wanted! - Clara

