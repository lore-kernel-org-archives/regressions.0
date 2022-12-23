Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5EA49E
	for <regressions@lists.linux.dev>; Fri, 23 Dec 2022 19:51:28 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id m19so8293296edj.8
        for <regressions@lists.linux.dev>; Fri, 23 Dec 2022 11:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1O5nw6K8QchpZNcUvDN6FRF4+x+KncDJQ5gRZIMULk=;
        b=f0R6scQzva0Lc5Nij+dIpVsNMGkuHZitAu68/ZTGWVwtG9dK7eEq/lR5sX03hxpUBK
         aiuosAvd8bgvaakiVCqpa/xEwAbEnxgUMNpEZW/Uc62wTVFHwo7yYnkRgL9E4eoXciVr
         az3reSWyypjiwPNG6Q5rHtiAvWE1I6G5wIaYtWfbQNkQgsbtgputQSfWcCRNOB7unatu
         XyFriFSTn1GyRuWmsJ17mWEbxgJLlBd0iRFyZ+lkKr//kykOxZE1goEkO6mFsGVeg1jU
         e8F/w4CtP9CFGI/fpnkKXn7krcKjGbO3S93YPhAU/KYT9/p2bFRM4a8XYNTjlbUi8YLJ
         9PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1O5nw6K8QchpZNcUvDN6FRF4+x+KncDJQ5gRZIMULk=;
        b=kxk/MQOOj4XA9jQo8OKbfOknIIUPKU+rO7SRWwy9LllNrlUlG/Ls8MLNYr92ZCoZWr
         yzazdFbraS5xlmCW4r+U7t+oamWL7Acq9ktf8Z1ilAFFA4dWUEqL/bxeMcFyg19a5+tH
         6PXkRiX1ns8PWgX4x/5Fa7Y0b85l+Txynrjaf9LjQ2m1fp9sscOBzPtXHZtr8uM0E2lE
         Uidz7pPZBPFX0sj0NyO7QD8Mqstg6Nc88C9ng6SHbn6mbnvvGAZiMe30ezGh88xTfru1
         3LZuncYDrwU4cEDZO+7Lpi6Q5MQ6JbVfKrlTpLhIlOZ+VGx8dXYfL8eKQjK55FUGzVL7
         1TiA==
X-Gm-Message-State: AFqh2krbAnKYfV5As0uxGEt6lTS56tG0xoNDhrOhf8ItsFjgFJ9F0i3M
	rU8J7KSu9OjAHnyghXpKgYimhmYsRkE=
X-Google-Smtp-Source: AMrXdXvTTOAHURFaLB+VL6ZCUYIZHOsrVeJQwTnJaMU05LMJ5BaHp8TsJr5grUO7fwPYQcRwbMy+aQ==
X-Received: by 2002:aa7:ca54:0:b0:47f:4901:d46d with SMTP id j20-20020aa7ca54000000b0047f4901d46dmr6054589edt.41.1671825086464;
        Fri, 23 Dec 2022 11:51:26 -0800 (PST)
Received: from [192.168.10.127] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id y3-20020a056402134300b0047f5f5bb5fasm1788694edw.62.2022.12.23.11.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 11:51:25 -0800 (PST)
Message-ID: <38cd1c38-b469-f25d-369e-57877865fdbb@gmail.com>
Date: Fri, 23 Dec 2022 20:51:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible regression with kernel 6.1.0 freezing (6.0.14 is fine)
 on haswell laptop
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <cb697d4e-406b-169b-c595-6521f8481304@gmail.com>
 <Y6W6Qxwq94y9QGFl@kroah.com>
Content-Language: en-US
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <Y6W6Qxwq94y9QGFl@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/12/2022 15:25, Greg KH wrote:
> Can you use 'git bisect' to find the offending commit?

Must learn a bit more about the distro I am using and what it requires 
for a custom kernel but I may try.

In the meantime, just to make sure I was not reporting an issue that had 
already been addressed, I installed the 6.1.1 kernel from arch linux.  
Same issue.

Forgot to mention that the lock is so bad that not even the Sysrq magic 
works.

Best,

Sergio

