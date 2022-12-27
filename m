Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC96801
	for <regressions@lists.linux.dev>; Tue, 27 Dec 2022 14:46:41 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id u19so32350854ejm.8
        for <regressions@lists.linux.dev>; Tue, 27 Dec 2022 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jftR37JDPZhhDCefSRbq5JLiyo4/OB0mmFtDa14MfrU=;
        b=Ut1jV9fiZF0EMh/I5rK/wNnrD9neIh4Mbz2by75q5UwOVQQq/9ybjJwCLiBv1WZb37
         2doyUY03hhrSZ3/2ZH9kJueWq4X6jgNX7rv5cxwxNTiV09JwIezBr1BKfn7xpwwf95H7
         WPWRc/WsGa5EiV3sJNeE9S0YpFWCbaZb/NTPQ006NVCbERIQgRuhsX2Y7JMNagBe8ni2
         Z04Co1GNVr/CkTjjCq1FBNLgc+DsuEMypS4nMO7kkWUltxQzgbjYoLZ3qHR4jQilUkWq
         5QnqoQjzYXRyCnVsMLzRH7QvPrpJEB3oqjOW19exQlzFIdtRQSMZvoRSgXWVwlpsx0Iv
         cSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jftR37JDPZhhDCefSRbq5JLiyo4/OB0mmFtDa14MfrU=;
        b=zdGE12LlV7vOgqZJO4ZCLZ5AI4YKkFKwtBimCUAG1qGlwFZQ9YyM5r/wYE4XzHsOjo
         ESqA5LuH97Ttf62B3uI19DtXo/s2+yDM2u1KZrPAFXN51TdGvYoV9IrPD+KMC6NfGMvW
         w1iEjzKtpMyhCF2puyJLEkxAc6FGWltQhsXMqS33V7JY6DO2qzNZLJ3o9Pvip5y7zkt0
         uxpAxhb+zKYrU7tu3Bi8U0S/EFFnGeJE8mh7tu0dHARroV8C1/23/eY7c5/veuYxUM6D
         Zip9krosqw1w55GmUCR2HdnSSgMFhtNYS4VxAikdnVfoF15Qg6XhLckgMDQ88+U3e3RE
         Z9BA==
X-Gm-Message-State: AFqh2koPmNFz0Vyeuggi43akbRPCyGBETDeRhCX78pmwJACmnFlmKO3C
	TYLM96pcZmhoPLmiwCiEvek=
X-Google-Smtp-Source: AMrXdXt/FMi8HPCMHBv/HJkH/IEj0UADwY03Mkk9wmrMngAqf1d9p0CQgGlX37N3xI9Gp1ww366a0w==
X-Received: by 2002:a17:906:724b:b0:7c1:7669:629 with SMTP id n11-20020a170906724b00b007c176690629mr18581452ejk.49.1672152399480;
        Tue, 27 Dec 2022 06:46:39 -0800 (PST)
Received: from [192.168.10.127] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id t20-20020a170906949400b007c10bb5b4b8sm6131867ejx.224.2022.12.27.06.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 06:46:38 -0800 (PST)
Message-ID: <18216b2c-d5f8-ada5-6110-192895772cbf@gmail.com>
Date: Tue, 27 Dec 2022 15:46:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible regression with kernel 6.1.0 freezing (6.0.14 is fine)
 on haswell laptop (issue identified and patch already available)
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <cb697d4e-406b-169b-c595-6521f8481304@gmail.com>
 <Y6W6Qxwq94y9QGFl@kroah.com> <38cd1c38-b469-f25d-369e-57877865fdbb@gmail.com>
 <8c3034f1-bedd-0e43-46e5-1e1fdca238a5@leemhuis.info>
Content-Language: en-US
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <8c3034f1-bedd-0e43-46e5-1e1fdca238a5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

My issue was the one described in 
https://patchwork.kernel.org/project/linux-wireless/patch/20221217085624.52077-1-nbd@nbd.name/

Thanks!

Sergio

On 24/12/2022 06:22, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
>
> On 23.12.22 20:51, Sergio Callegari wrote:
>> On 23/12/2022 15:25, Greg KH wrote:
>>
>>> Reported to the distro, but seems serious enough to report here too.
> Out of curiosity: where?
>
>>> Can you use 'git bisect' to find the offending commit?
>> Must learn a bit more about the distro I am using and what it requires
>> for a custom kernel but I may try.
> I'm writing a document I plan to submit for inclusion that might be of
> help for you:
>
> http://www.leemhuis.info/files/misc/How%20to%20quickly%20build%20a%20Linux%20kernel%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html
>
> It doesn't cover bisection, I left that for later (and maybe separate
> document), as I want this one reviewed and merged first.
>
> Ciao, Thorsten
