Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22617E
	for <regressions@lists.linux.dev>; Sat,  3 Sep 2022 15:09:56 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso8253917pjk.0
        for <regressions@lists.linux.dev>; Sat, 03 Sep 2022 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=jtc7SNuzeIcNvrv3E2iX9Cn2tO1gjlb9ov73pUdjlI8=;
        b=ZGiuyqSn1YVQeGpSFp3XJl32Di8/xze82znyjJWY0XsJ6B4cOgEzx7rNrFisvfoQAN
         V0l0LXpbyKWD83EZI5037r4N0+jq/mG2EtVo9AHYQxosHqGJ9Z3gzAa4t0MQnb8grTDF
         zwtSs1YJPQMEUF0E7jGKOJUTcxtU9dii7RToVQVlQtp4NuiwRRr8sPBTGyKI4fw/SOAa
         j/upIjMygmMv8faAYyRBlwAhoOA4Br/h1Lif2TVKgS6C299SwMWM+ObBKxwq2CLK90zJ
         7gBC+/r6NjkaDKxzdA8+YFmkDlK6VSoirmAi4wL0rVYusx5jvBpeGLEeJcvFSGZtMhF4
         Ye4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=jtc7SNuzeIcNvrv3E2iX9Cn2tO1gjlb9ov73pUdjlI8=;
        b=VLhrl4IOnsm8QIm/nngeBjrbdFFtrXw9cMMkL2rz3UO1kGYxTdl37jhRbpVVbAKUxn
         njLAQQh4loWhdRJ64V4dscJ0JXSupgrPWwMeeSKtmAeEVqr+XcuGmqrYcPU/01d6vi40
         NUeyXOme9m/dkC7GWVl5LmRShNeXA1axFDWWDRDdXyQhjXLOkXyb1Z+N7CNXlx5Plrcd
         v77Jk/YlE5LbcbOLv3S44wFCQsxVJf9AGfcsAH0Kn56IvmaniAQpM8pxQwNZLOjIgSoH
         jw2YiFqw8hnawwuGAJlR+OKMv9nDfQuCn28+84mEeejQUgK+bDFxhHnKtmlvX/o7Aumb
         oXjw==
X-Gm-Message-State: ACgBeo36T38093R+r6VEL1zpSMcmca8qLg2OdEJOPRpGGREA8qM0UBQL
	b9QpiWuiXIzKT7V4vP4aN08=
X-Google-Smtp-Source: AA6agR6u48YUysWaNcA9gdUTpOEVLmdWjwDo5XE5nO0/v/HQX5TavYw0M86RxFxSs49/yOlLZU/fNw==
X-Received: by 2002:a17:902:c10c:b0:176:9070:8039 with SMTP id 12-20020a170902c10c00b0017690708039mr1646901pli.88.1662217796030;
        Sat, 03 Sep 2022 08:09:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id nn5-20020a17090b38c500b001f7a76d6f28sm3464274pjb.18.2022.09.03.08.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 08:09:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
Date: Sat, 3 Sep 2022 08:09:51 -0700
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
To: Christopher Klooz <py0xc3@my.mail.de>, eugene.shalygin@gmail.com
Cc: linux-hwmon@vger.kernel.org, regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/22 04:00, Christopher Klooz wrote:
> Hi Eugene,
> 
> Currently, we have user reports of at least 4 Fedora installations that have issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
> 
> All issues can be solved by blacklisting asus_ec_sensors.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2121844
> 
> The bugzilla report contains kernel logs of two machines, one with nvidia-driver and one without a tainted kernel.
> 
> The report and the contained ask.fedora link contain some elaborations of how the issue manifests at the users' machines. The major issue is a wrong output of battery power percentage (in one case it gets stuck, in the other cases is becomes erratic). Also, in one case it has effects on suspending (see the report).
> 
> On the Internet, there are already reports from other Linux distributions noting the issue and the same solution (blacklisting).
> 

Eugene,

do you have an immediate idea other than reverting the patch pointed to in the bug report ?

Thanks,
Guenter

