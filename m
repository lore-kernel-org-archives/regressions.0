Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9154419
	for <regressions@lists.linux.dev>; Fri, 22 Sep 2023 11:09:08 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690bd8f89baso1777659b3a.2
        for <regressions@lists.linux.dev>; Fri, 22 Sep 2023 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695380948; x=1695985748; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdhW5ZmgkkMXcQqSV8OZhLWTgesihtREKwvty/DX1/A=;
        b=U+HMXTdOY5bRRbYEjCmni+kWLyU8AVSqwqTL66za5ppbgVaQdS+utz0BulB+5NtA8Y
         9IWoItUqiHZH+0Xc2lc9ojPxmGZFkWaVHHt0d/yY5V9igScSY0FItKZktknw6pRkF5np
         IanPi0NQ6ny2PDZWOwczu+4ZGSu5FXzTefOIIokuFoNtIn+Z4rnxs/9kIsowyb8IHAla
         jHwYu5lh17J4J9RywOVdNfHBEfpc9+iX/7EqcGI3QbhaeLmN4FfDL7I5g45HELVuRbaD
         4Hjikxj/kU79uuYqItw37VaFRWFArCMrVi8soFXZxp7jZGr8Lv1zRbEvv/MMC1PTu9We
         Y2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695380948; x=1695985748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdhW5ZmgkkMXcQqSV8OZhLWTgesihtREKwvty/DX1/A=;
        b=nTGavc+0mKcYeqC9fPleqHs93jQqSnrjwm+EaKEhomYxReSaF6+HYJ1+oBpYg3ggMz
         E86E42i3+EMzIKjR4sVI3KctAu5e+YpGTrNFKzT4W4ifpog/Lnj2txTCqDnEZJ17TSda
         njFlftQnFiqMYfexLJ3pGkf5z+CowMpFevurztTDe5cp9F34bwckzqqy3x9IsMTgys3Z
         mw++7Hj1DcSd7UEYZaeYmZWn7tonYGAIbIJMLmyTSOU4pmSBj4qx2EtkwmqTsUtiry//
         pi0ko2ylxoeNpeGPTXAIOJB9TL0AHv6PusiDudhwSy/hiVOByG19YepX93fD4+OsvbPc
         MyMg==
X-Gm-Message-State: AOJu0Yxm27w9Yt4dlRFqw7q8NUMsdHAwDasPU5yqtxr0J9l6zLhL/ecF
	mKYsKrI+QKv79xLaDdOlG0rWYrP6kmk=
X-Google-Smtp-Source: AGHT+IF9FbMEYzQFU0lHgOYWASfkHSHMN0ogg0RkFd7Q9Toczyt8nskYuzVLw8/uzWQIAxMrHK/iFQ==
X-Received: by 2002:a05:6a21:81a9:b0:15d:c274:2eb1 with SMTP id pd41-20020a056a2181a900b0015dc2742eb1mr1017324pzb.10.1695380947827;
        Fri, 22 Sep 2023 04:09:07 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090a800100b00276b60aa43bsm4634734pjn.17.2023.09.22.04.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 04:09:07 -0700 (PDT)
Message-ID: <c0ea6ee9-92c2-4e9e-b896-d079b6150bbc@gmail.com>
Date: Fri, 22 Sep 2023 18:09:00 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Urgent Bug Report Kernel crash 6.5.2
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Martin Zaharinov <micron10@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev <netdev@vger.kernel.org>, patchwork-bot+netdevbpf@kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Stephen Hemminger <stephen@networkplumber.org>, kuba+netdrv@kernel.org,
 dsahern@gmail.com, Florian Westphal <fw@strlen.de>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Wangyang Guo <wangyang.guo@intel.com>,
 Arjan Van De Ven <arjan.van.de.ven@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <A416E134-BFAA-45FE-9061-9545F6DCC246@gmail.com>
 <CANn89iKXxyAQG-N+mdhNA8H+LEf=OK+goMFxYCV6yU1BpE=Xvw@mail.gmail.com>
 <BB129799-E196-428C-909D-721670DD5E21@gmail.com> <ZQqOJOa_qTwz_k0V@debian.me>
 <94BC75CD-A34A-4FED-A2EA-C18A28512230@gmail.com>
 <CANn89iKvv7F9G8AbYTEu7wca_SDHEp4GVTOEWk7_Yq0KFJrWgw@mail.gmail.com>
 <CANn89iJCJhJ=RWqPGkdbPoXhoa1W9ovi0s1t4242vsz-1=0WLw@mail.gmail.com>
 <85F1F301-BECA-4210-A81F-12CAEEC85FD7@gmail.com>
 <be58d429-90d1-42ff-a36b-da318db6ee68@gmail.com>
 <6A98504D-DB99-42A5-A829-B81739822CB2@gmail.com> <ZQ0EtyRxjzQTrPNd@debian.me>
 <bab8164c-f74f-44fe-ac3e-c078d30ab1e4@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <bab8164c-f74f-44fe-ac3e-c078d30ab1e4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/09/2023 16:50, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 22.09.23 05:06, Bagas Sanjaya wrote:
>> [To Thorsten: I'm unsure if the reporter do the bisection and suddenly he found
>> the culprit commit. Should I add it to regzbot?
> 
> For now: no, things are too confusing and without knowing the culprit I
> guess nobody will look into this unless we are extremely lucky.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

