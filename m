Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E910E1
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 00:42:30 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-686be3cbea0so260483b3a.0
        for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693356150; x=1693960950; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqBGU9u1vGB8q2WDmOt/P3uNLvgaRaNASZ7VqIyPuPA=;
        b=KyfqR0b3+W5gSAzGD4NiEGamHO/8tLNM4mcNaGJ1/ZNPfKxjk1OuSMyoWy0JoxqrNx
         De07TD7l98WaA318gUe2872ny5LAvr32f5efMNLVz/EBketvHbZBeL5aLM5GMk8tQvIs
         5bpZveJI4vLkOLgNQeavw7Bd7CS3uCWM4gHY5Adm860gIPr+lU9OEojJynIto1AfOahy
         ybO8kvRPXtxylSkpzV+AjSXOHMDL867ax4fDFb23coQt8AtWoH4lE6LwKCIvJjdOahbu
         jHnpvvYigmLYaLw/9PCC9Fx1I7Uypq24JAsWGXDNgP4Gkr185s4fZcgjcaNjwb3Sl6iP
         mQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693356150; x=1693960950;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqBGU9u1vGB8q2WDmOt/P3uNLvgaRaNASZ7VqIyPuPA=;
        b=RA7staWrRNdpkE5JA6p7+In1ORms2oYmNcO6Z8TuHiTOsQwiKIL/nqjZQsHdFL6Ori
         fQCrP5t6MK6PSAbsFNS/oLeOqKsZrWO0wajmvyAb7pgpERMFg5lDazJ7YLldRObv7LIp
         89N+1Zkx/2bj5wsmRb9XtJwbCcbjF17ECVy/KzoGDD5F6yRRkr87657Nzaa4npkuZ4r0
         jNFREwNe8Y3C0NZL5FhqxtPzPoYwH1WH84Y0t0nsgs7FFAe0hM2B3M/azbbDZ2XULWvc
         n10thkb/7dY0pbnB0/Lrqfb7mRRJzdapqP5QOhycgBAQjhosEw6/xJ+WUhSzNnrtCVxe
         vOhw==
X-Gm-Message-State: AOJu0Yx1/SIJz/YFRTI8yKXT8tj4ei/ZAnAeRQ7FG42RINjJnvqhWmqW
	IDlflC3Rgkia5wGgVyt6I0HQCYpCZgo=
X-Google-Smtp-Source: AGHT+IFI9e21DDk43+YPYhcUOd1/CtgBttiDPMm7ASOhe3wBqKJz22o2cMS7DIUdPGR2LbK2Yj7j0A==
X-Received: by 2002:a17:90b:4c04:b0:26b:535e:fc12 with SMTP id na4-20020a17090b4c0400b0026b535efc12mr1318629pjb.7.1693356149943;
        Tue, 29 Aug 2023 17:42:29 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id hi23-20020a17090b30d700b002636dfcc6f5sm167066pjb.3.2023.08.29.17.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 17:42:29 -0700 (PDT)
Message-ID: <085d4cb6-dd7c-9093-1464-9e421961cb65@gmail.com>
Date: Wed, 30 Aug 2023 07:42:24 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Fwd: WARNING: CPU: 13 PID: 3837105 at kernel/sched/sched.h:1561
 __cfsb_csd_unthrottle+0x149/0x160
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hao Jia <jiahao.os@bytedance.com>, Ben Segall <bsegall@google.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Igor Raits <igor.raits@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>
References: <a5dd536d-041a-2ce9-f4b7-64d8d85c86dc@gmail.com>
In-Reply-To: <a5dd536d-041a-2ce9-f4b7-64d8d85c86dc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2023 07:37, Bagas Sanjaya wrote:
>> [293790.956625] CPU: 13 PID: 3837105 Comm: QueryWorker-30f Tainted: G        W   E      6.4.12-1.gdc.el9.x86_64 #1
>> [293790.957963] Hardware name: RDO OpenStack Compute/RHEL, BIOS edk2-20230301gitf80f052277c8-2.el9 03/01/2023

To Igor: Does vanilla v6.4.12 also exhibit this regression?

-- 
An old man doll... just what I always wanted! - Clara

