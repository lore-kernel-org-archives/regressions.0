Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12D3ED6
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 11:37:37 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99de884ad25so551665966b.3
        for <regressions@lists.linux.dev>; Wed, 06 Sep 2023 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694000256; x=1694605056; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tIoumIefJG2c1Xl1YXw1HkNSCZ/LNc5JVGZQ1+f53m4=;
        b=S2+syHc/HdXWlvn8mzEegPB4GK1ECrTQYQDP2fBIHLBGIFIqBUGeQDjs6+BUM/fGVQ
         LPhHqb+8L7+FWvwwYMoBY3xJU6Q+kkKQwOQr+5Il6VNjExPvKjU0xRZc9dwwjE+cUm7l
         +guKQ2K1MOgN3gZkk8K+ayoQqR/RCj5I2wvRT555aZo+MuafUYWCjAZV4sg+X02twymu
         JYw/7piRKFv5vkIbhH0jqZNIaZQydncaVq3RuRnAa7UyHRDFWzXD95WUOSrSQxzAX8Qg
         StXaLbYSswIIZGniiDTHe15ZFqrhgepwItjfLmN0lDFRtBKnRlyySE7jdIG3NSJYjsPn
         t5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694000256; x=1694605056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIoumIefJG2c1Xl1YXw1HkNSCZ/LNc5JVGZQ1+f53m4=;
        b=XMTRY3KaFf8TlP5GyIumRS06YARYsyihDnrBTMBbRDCEls4rsQsQJrvROPTsrEFRKs
         h+DlC6V8eRhcS+L5uHSrFqs28DP6b/QWNgqfeyQl3+cQBQ7eED42pLRMD6ofd1+Ceyc8
         mqjMmopmnUIXCA+N4XALLneKJ8HVilm+fBgU+Jszwr7wE3vSAymWvs1Rocgk6oWaAhk/
         6WrzE4oIyuPbgKYRetfReAP7ZZKOIlEO3/t9MtI0uTJSARM5iHxcHDbcpgsTSFXXDNlI
         6Lh6A/j4NyE2CQX6ss1ZEL1BYYmVV09vE2GSheiKKgca1DnBi6VFcafh123ELaUTm38U
         drSw==
X-Gm-Message-State: AOJu0Yz4NVtE4q9BBSE0TcInodf0S/mKuFEVCJvGFeyNBY3lH5jvL7Hx
	6kVih/o3uIfm9VRBKilu718=
X-Google-Smtp-Source: AGHT+IEraBL9rxIHDCWQ2SDZzeswphRbaKD1d3l7wr8DdkMV0w8KJiGZQFBUHKBDnqhRG1Yt475htA==
X-Received: by 2002:a17:906:4e:b0:9a5:cf23:de54 with SMTP id 14-20020a170906004e00b009a5cf23de54mr2168348ejg.38.1694000255736;
        Wed, 06 Sep 2023 04:37:35 -0700 (PDT)
Received: from [192.168.10.127] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id f3-20020a170906824300b0099b921de301sm8875255ejx.159.2023.09.06.04.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 04:37:35 -0700 (PDT)
Message-ID: <075308b2-7768-40b2-9c00-a5a14df62678@gmail.com>
Date: Wed, 6 Sep 2023 13:37:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with AX88179A: can't manually set MAC address anymore
Content-Language: en-US, it-IT
To: Bagas Sanjaya <bagasdotme@gmail.com>, netdev@vger.kernel.org
Cc: Linux Kernel Mailing list <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Oliver Neukum <oliver@neukum.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <54cb50af-b8e7-397b-ff7e-f6933b01a4b9@gmail.com>
 <ZPcfsd_QcJwQq0dK@debian.me> <6315027e-d1ab-4dec-acf2-0a77bb948807@gmail.com>
 <ZPfZQsLKG9LKGR1G@debian.me>
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <ZPfZQsLKG9LKGR1G@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 06/09/2023 03:43, Bagas Sanjaya wrote:
> On Tue, Sep 05, 2023 at 09:34:53PM +0200, Sergio Callegari wrote:
>> I mean that with kernel 5.15 I could use the in-tree module with some
>> glitches (interface occasionally stopping on teleconferencing) as well as
>> the indicated out of tree module with no glitches.
>>
>> With current kernels (certainly from 6.2 on) manually setting a MAC address
>> breaks the interface. Furthermore, even if it compiles and loads fine, it is
>> impossible to use the out of tree module because it does not create the eth
>> device anymore (the eth device now appears with the cdc_ncn module). Being
>> this an out of tree module, this is not very important, though.
> Then can you please file issue against your external module on that
> GH link?

Done, but as mentioned, out-of-tree implementations on GH are less 
interesting than having the in-tree driver working properly.

So if the in-tree driver could be fixed to correctly support the manual 
configuration of the hardware (MAC) address as it used to be that would 
be the best. I hope that Andrew Lunn's hypothesis is correct, and that 
cdc_ncm can be extended to work with AX88179A even when a manual MAC 
addr is configured.

Thanks,

Sergio


