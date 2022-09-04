Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8078E3229
	for <regressions@lists.linux.dev>; Sun,  4 Sep 2022 14:10:24 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id f24so6264511plr.1
        for <regressions@lists.linux.dev>; Sun, 04 Sep 2022 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=/gHBjKku3P8caFwwAMIPXhFBShRIJ0U2g3RpNf94/7k=;
        b=AtnwMSPJEBsTMyufxEdrGKx3rLIdydFUmWAvlx3hwGObbrSrjLVZML0ZwrxeJ7q+Ep
         aQWTZJMz3QEA3WqogN0ZKLDcyfIQ+v449NUDIz1mA4zKgw4wT7Cswndcht6rkDa4zZj1
         /DuThg/6ygVFJT1ifiV2nGa4fnarJ33IaEAPSpLdfcSQ9RAFJF1Z4AggBVZF+/9T4CXZ
         wh7/IDegTIJH+zicW2FKW3zoMypvsO19/oOxtXx/TXAUiZZtb1W1NLkIZNfue6AN+G+3
         1g61KFvRxgnMpXWVP19Ku6W/ET088Ea0aWCKjxU1LKAcRdnUBsZY8bhIdJxz4LvINc+s
         TCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=/gHBjKku3P8caFwwAMIPXhFBShRIJ0U2g3RpNf94/7k=;
        b=K+pWxfDbaKKzfkBX9qLRoeUcQHMqmYLI9yeRskB/zWu+TIupoWw3jTvnxd3MWs6PLC
         PZ57ejSB2YqJhlrewQkncmRZBjqt3H9kWcvGuZcm/V3bgfW7giTikqGLG40JS6CgDzVC
         8J/Wzo/Y9CtPdfuknO5vq5daUMa31duEuA9DGFMYNJEU1A+NxsirBz4L3rYHTKC1tr1j
         bVas6CqeCaATZTp8PFOAc/mXbvJFOJzwns3dCl7jGL8+9MmkuqhAkfmafo4PoLBnfofV
         1IrBZN8of95Avq1CnEC9y+4ReI4aEztwRkteJ47VrtiQGUNwNs/M7CFc9RpzdWxuQA0V
         EYjA==
X-Gm-Message-State: ACgBeo0k1NfVi2uAe15p6aCrNBBXIgmMOG35LDqUe9SsVozUSupvRgaW
	LjPvvj3EbfazoS65u0R95EQ=
X-Google-Smtp-Source: AA6agR4nf0ceOu4X8RBjT9NyoIEGErZP8cxSRcAHLRHP2S1fbAjprO/zObcGiJdMFs6ZKhutHZWYrQ==
X-Received: by 2002:a17:90a:c789:b0:1fa:6bc0:77f6 with SMTP id gn9-20020a17090ac78900b001fa6bc077f6mr15254214pjb.1.1662300623804;
        Sun, 04 Sep 2022 07:10:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k14-20020aa79d0e000000b0052d2b55be32sm5872495pfp.171.2022.09.04.07.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 07:10:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1d234266-af01-5d8e-408f-ca58b53d870e@roeck-us.net>
Date: Sun, 4 Sep 2022 07:10:10 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Content-Language: en-US
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
 regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
 <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
 <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
 <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
 <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
 <2f14746c-8051-b711-cd28-7ca521d21c4d@roeck-us.net>
 <CAB95QARMOq0ie0SmhRx73L=mptTaa-eEHfNjGRH5CXvVFh-RLw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAB95QARMOq0ie0SmhRx73L=mptTaa-eEHfNjGRH5CXvVFh-RLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/22 06:19, Eugene Shalygin wrote:
> On Sun, 4 Sept 2022 at 01:47, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> A driver with a probe function can be unloaded and reloaded manually.
>> I don't see how you can do that if the functions are marked __init
>> and the driver is built into the kernel.
> 
> Did that and a user tested those changes. Unfortunately, the ACPI EC
> is still inoperational if a module uses the ACPI id of the EC device
> and its probe function returns an error. Looks like I have to change
> MODULE_DEVICE_TABLE completely.
> 

If you insist on the __probe name hack, please add a note to the code
explaining why that name is necessary. There is only one single driver
besides this using that trick (I'd call it hack), hardly anyone will
know about it, and thus it needs to be explained in the driver to
prevent that the structure is renamed.

Having said that, how did you de-instantiate the device when it was
built into the kernel ?

Thanks,
Guenter
