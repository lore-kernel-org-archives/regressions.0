Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A863C10
	for <regressions@lists.linux.dev>; Tue, 13 Sep 2022 15:33:23 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id t65so11681943pgt.2
        for <regressions@lists.linux.dev>; Tue, 13 Sep 2022 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=iJYXgpyoM4W9FbPBjOJQ/lNpfrEnMjCmpPpyo4wVWhM=;
        b=c1sxEX2Ib8z9hy2piq5AZbUupPNtEWY5GhTSAfoPwJ/iq27se+S5LxgASuB12efoH1
         4NNYkKka+Bq5ElJjsyyQa2XSlhzb6rePXZS3R994skzfukmmXL9jWV9Fx+Zut/LxvNR+
         4GvEyBdFttKdxZtYt8DOF8cqihyOY/MhhwxL5/anWQdmoIi75r9W61EaEzN8dMoy8Kql
         XkCHv3gZcPCADXCPBO7G5nFxIirEnZWzSzEJawyygMDYJIfcGzPvMd2NJ+qqRaGAXN11
         RBhCmwfRUtZm8fGNL2XRT+Bq+iq8Kj+Lu2ieuXUiG7ed6sAu539zldX5e5XtkDycEBXP
         UNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=iJYXgpyoM4W9FbPBjOJQ/lNpfrEnMjCmpPpyo4wVWhM=;
        b=4cWgKFfObsCxEYNrfeaTRO2CHmRQNQQjaHTJwSo1LdSfx4XjOSdsGg4tpw93xAeyD4
         W+GKuQvMZfKbZov1DqEzXeqyvbTCzyf64Ny37P8aN1hoB84HA5T8SmqdBSGqi0qyOuYi
         5rShco1nlaom8Ua2oOEnF3TTqKSyle3vUq0pORKySj0SnSO7NWXYtJOjQPwx89F6Slpj
         jd2rw/agXxSmBuwX9Py/3WRoD8BXwqCPm7NWs8yylOYnq1QN+Z2dVZMxIKB5/x0eiV5K
         YC7FsiYi4GDAgpjLGZXq1lKJW+hK4wNF5gXB7p16CS6LMOn8EzD8E2ZXfk4fu1VdySUC
         G0mg==
X-Gm-Message-State: ACgBeo2kHivmWXZvKMPyKS4yyA2P5wO+GToSDINX3YisAmS97IIQeIF/
	H4espDdJgu96CKumoeEHeMB3fse/KtDKbw==
X-Google-Smtp-Source: AA6agR4tGi0xe39/HTg8WdhVQCob56kkLJi+uZY/nYmAp7olxRKbd6cTucqiqF5DIMPV9qOM3ek2JA==
X-Received: by 2002:a63:3d3:0:b0:439:4408:246 with SMTP id 202-20020a6303d3000000b0043944080246mr2859412pgd.563.1663083202845;
        Tue, 13 Sep 2022 08:33:22 -0700 (PDT)
Received: from [192.168.0.131] (198-27-223-25.fiber.dynamic.sonic.net. [198.27.223.25])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902cec200b0015e8d4eb219sm8624175plg.99.2022.09.13.08.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 08:33:22 -0700 (PDT)
Message-ID: <a451cdbc-326a-e613-50f7-007a7c497c87@gmail.com>
Date: Tue, 13 Sep 2022 08:33:19 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Bug] [Deadlock] Kernel thread deadlock in rfcomm socket release
 when connect interrupted
Content-Language: en-US
To: Peter Sutton <peter@foxdogstudios.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev
References: <CAD+dNTsbuU4w+Y_P7o+VEN7BYCAbZuwZx2+tH+OTzCdcZF82YA@mail.gmail.com>
 <24e95c8b-dc05-0d00-50bb-58b71c5baf94@molgen.mpg.de>
 <CAD+dNTuRThoa2OSzQ27tENB29GJ4oD0j3D+P4k42HzopEeTJMw@mail.gmail.com>
 <CAD+dNTsqBEjzG7BinKtxveH9faJqss89WPufbSsaB5FZRDgOPA@mail.gmail.com>
 <ef7a1421-06c5-f3b7-8c7f-7fdfd7862c96@molgen.mpg.de>
 <e7c8127a-d561-3a3d-f208-770f3abbee17@leemhuis.info>
 <CAD+dNTsnVpyFKyZcAgnqAZz-e2upjFd3NGWV=hPhywL8k0g6Nw@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
In-Reply-To: <CAD+dNTsnVpyFKyZcAgnqAZz-e2upjFd3NGWV=hPhywL8k0g6Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 13/9/22 08:20, Peter Sutton wrote:
>>   a fix for a deadlock for RFCOMM sk state change was posted last year already:
>>
>> https://lore.kernel.org/all/20211004180734.434511-1-desmondcheongzx@gmail.com/
>>
>> It seems it never went anywhere, unless I'm missing something. Is that
>> maybe the same problem or somehow related?
> 
> I mentioned this on the Arch Linux Matrix channel. The `linux` package
> maintainer said they had encountered the same and added the linked
> patch to the Arch Linux kernel package but removed it because it
> wasn't merged (which explains why my issue went way then came back).
> Anyway, we compiled a 5.19.8 `linux` package with the patch (which
> fixes my issue) and they said they'll add the patch back to the linux
> package.
Thanks for following up on this issue. I'd completely missed it until 
recently, and Luiz has suggested an alternative approach to fixing the 
problem here:

https://lore.kernel.org/lkml/CABBYNZJxzA0U5bL6d0KtAkZw6yfUSNcpaH3Oh=xZFZdER8FCog@mail.gmail.com/

I'm planning to take a crack at it, but probably don't have the cycles 
for another week or so.

Best wishes,
Desmond
