Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608021346
	for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB1DqkIG"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27d153c7f00so553439a91.3
        for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697104376; x=1697709176; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GPcG4HISW15HdH/wIIcwcI9FurWIe0F/LA1VfavK10=;
        b=WB1DqkIGmvYMMmDyIO9rYovml0FKExdiRHyQbAeCtt13eamDkCxWSBGjmFJPSJQ6q9
         k2RA2nRvnT3RaSmI6bV2v/AC2USNb1LiXHsIZhhH6nfDWDhJyXc6vnGAgaFbIul/oGY0
         0Q89DVbTBpXiBLiA6S3gvcvZT+CCdyGMP+85CqtZDOeCyI8TmayjLvsmRBLzbti3t6bx
         TfIW9ORU2kNiQfZcuooc3UazAR2/MqcG/tT01mfTRDLfwkJVYUeAtyj06cm6iQWnBroO
         /3EY6eX/C7xrJxxvNC2SGx7XT7EsgaWTUOPe4ngqULhEnyZ7g1CWdHMcSqc7YrOnvear
         EmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697104376; x=1697709176;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5GPcG4HISW15HdH/wIIcwcI9FurWIe0F/LA1VfavK10=;
        b=v1ndpPkbE3FC21wRSPktj5oatG9yllDYyIvukUya7cTzOlcSsTpFsA0CkV/lkiLQnz
         oXOUQ+fyz1GFhZO8rZMyI+MiJ/orrMHZWyjlQRPneSFZf9JrrS2VWRHJVkYzec74NeEv
         ap2rDPQXMI7EXQsBSNsx4AQiNsyKzRPIa3vuSoYC/t7v1SmQM+5FeYhH+IZKcz60V2Uw
         wtc/ugBS04YmyUslWNxdBglEGj5fIm6QILdXAKBcLETfbdYz4E0LBiV+7q+np/LtS+kY
         sMLfE1e2rcy5ifMP+NiQ8HkfkL3dy5iRzLqMG3QvcexgwFDQRa7M6t+eux4lyywixkxC
         XjxQ==
X-Gm-Message-State: AOJu0Yw/r5l9NfwTGZ6yKHPG7gGhHRTgBX13vnP7NvQqMefsGpIaiySH
	mjZRREknUiAJLVlAiIK5CfU=
X-Google-Smtp-Source: AGHT+IE8Oe9KXbpDRNnlaCTZlxxhVs6faIab8J1drxYmO04exZINnSUsvkzdXNKkoTcZ/bL1+Zzl/A==
X-Received: by 2002:a17:90a:b78f:b0:26f:7555:76 with SMTP id m15-20020a17090ab78f00b0026f75550076mr20070356pjr.11.1697104375764;
        Thu, 12 Oct 2023 02:52:55 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id z18-20020a17090abd9200b002609cadc56esm1421733pjr.11.2023.10.12.02.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:52:55 -0700 (PDT)
Message-ID: <267abf02-4b60-4a2e-92cd-709e3da6f7d3@gmail.com>
Date: Thu, 12 Oct 2023 16:52:50 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Intel Wireless WAN <linuxwwan@intel.com>
Cc: M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Loic Poulain <loic.poulain@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Intel 7560 LTE Modem stops working after resuming from standby
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I noticed a few days ago, after Fedora moved to Kernel 6.5, that my Intel LTE Modem was not working anymore after resuming from standby. 
> 
> The journal listed this error message multiple times:
> kernel: iosm 0000:01:00.0: msg timeout
> 
> It took me a while to determine the root cause of the problem, since the modem did not work either in the following warm reboots. 
> Only a shutdown revived the modem.
> 
> I did a bisection of the error and I was able to find the culprit:
> 
> [e4f5073d53be6cec0c654fac98372047efb66947] net: wwan: iosm: enable runtime pm support for 7560

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: e4f5073d53be6c https://bugzilla.kernel.org/show_bug.cgi?id=217996
#regzbot title: pm support for Intel 7560 makes the modem stops working after resume

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217996

-- 
An old man doll... just what I always wanted! - Clara
