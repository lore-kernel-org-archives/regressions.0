Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38A17DB
	for <regressions@lists.linux.dev>; Fri, 24 Mar 2023 03:15:49 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id j13so415617pjd.1
        for <regressions@lists.linux.dev>; Thu, 23 Mar 2023 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679627749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hdx17vCNYV2qLoCsvooDCPi5rNQI2bUy5M3IQg4/xWk=;
        b=JK+i6OHp77Gh9yVqhRsByrp/7qPPA5poLkAPSVRQSqWwePWebgnMU09PRB7yJCqwg4
         c6Q8eNOFF+aoL+h5CypkP0Q9ErUU+fhG9/NcZRdYtKjIsaj7U3mhjiezHZCKL5RI9rkJ
         JYX4vV+dW+SUq/rsxDcj+FvIhkaeqrbHAUbO08ETLyV6guge5KZgcK/NFvNPQHBePuQZ
         9ER7/Rw0OI+l7HhKP5UDKk1t4A56QdqA656swjfMUjqVA7cfmSsYDkv/Yzjj24w/R/Aq
         c0Rf424NQ0gXK5ppnd03vjxggTarePvgR/Oyw78BXt9SzmPxNdZyIRGR6p49rkOhgain
         ADuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679627749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hdx17vCNYV2qLoCsvooDCPi5rNQI2bUy5M3IQg4/xWk=;
        b=umKfkbgmP1/T1nofNeou3RuhiyZWsjE3u9nytRvQWTa4IujnUgMC9QTMc6NQqgQwXh
         SoZVPRAC6T+RYdkaKm1nYtHOyppeeKx8Kk2Lq+fqEtHOzU80kUX8CAbiia/vgP/l3rjK
         NNvqfSZ2I7t4GwCHsHWjwvEJpUpLvqck3ObraXCHiiPelXnnVmKlLSlud/PA6bwTcAso
         mCqghis6HXHG9m+PKQTU9uVOJ0FSmaPsCuQI3BE90wiZ1CzHay/IcqYK9kl6gCf/RYsy
         GjPXradJafzYd+REHIpp2ToVtRKOLhnBGxHirl7hlRg9N8t8qhG1+WMhOzuxqa9hE48r
         ahSg==
X-Gm-Message-State: AAQBX9fuMcRK1K77xg4mFnCmqJplGL800/QxEcJDOUV50Lsnwi+lFepe
	fNim+ArHWchjBSN0eN9Gk6w=
X-Google-Smtp-Source: AKy350b4kA4WfvmHy4tmiCmwooO/ycbfDk2tkIx8YzyYXoTDnNRbbKq7XcujPcr1x6MYJixD89fHrg==
X-Received: by 2002:a17:903:110e:b0:19e:9807:de48 with SMTP id n14-20020a170903110e00b0019e9807de48mr1467352plh.23.1679627749334;
        Thu, 23 Mar 2023 20:15:49 -0700 (PDT)
Received: from [192.168.43.80] (subs09a-223-255-225-66.three.co.id. [223.255.225.66])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709029a9300b001a1f6f15c3fsm3264902plp.72.2023.03.23.20.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 20:15:49 -0700 (PDT)
Message-ID: <82822f1b-1c3a-bc3c-0ddb-fe875a17df87@gmail.com>
Date: Fri, 24 Mar 2023 10:15:45 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [REGRESSION] kbl-r5514-5663-max hdmi no longer working
To: Jason Montleon <jmontleo@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
References: <CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/13/23 23:34, Jason Montleon wrote:
> It looks like HDMI audio stopped working in 5.17-rc1. I ran a bisect
> which points to 636110411ca726f19ef8e87b0be51bb9a4cdef06. I built
> 5.17.14 with it reverted and it restored HDMI output, but it doesn't
> revert cleanly from 5.18 onward.
> 
>>From what I can tell it looks like -ENOTSUPP is returned from
> snd_soc_dai_set_stream for hdmi1 and hdmi2 now. I'm not sure if that's
> expected, but I made the following change and I have working HDMI
> audio now. https://gist.github.com/jmontleon/4780154c309f956d97ca9a304a00da3f
> 

Hi,

Would you like to post the gist above as proper patch (see
Documentation/process/submitting-patches.rst for instructions on
patch submission)?

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

