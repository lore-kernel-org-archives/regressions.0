Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482B48476
	for <regressions@lists.linux.dev>; Fri, 23 Dec 2022 14:14:01 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id tz12so12287897ejc.9
        for <regressions@lists.linux.dev>; Fri, 23 Dec 2022 06:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaik9Y22B1m7P468obc4AGNMAP0WdwZv7P0auUPUa/E=;
        b=eXDr57n19OA/kJEWo1V5mEOREHmHZfGhe90LcslRw7B4uSCv5OtS9mnIDuM8/EA6z2
         dCyH5jIpbLI5Q4uT+MIzdVBP+cxFvoTz0GVoM/vaYUVoSItVFLi07aqbJWHhDAUl4c9D
         ZX2RqzM0BR4W/NMx0TeT20cQiKpFVPA/s7XDI8LZHFZyXQHT6Xs0Pb2RoVQPWDCTCC7M
         +qHWqonaOwZ6a6vjDAi0Fd47e0im1UfPJWu0Lt0aIYB+mssGltaSizrcIeB3NjnCMk1k
         P4ssk/T6k1+JfNV43uuDomzAMNLTcJ1OUEWlYXijV4qnc/eKMRvivt1CJYl5ZGhZcZMY
         gcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaik9Y22B1m7P468obc4AGNMAP0WdwZv7P0auUPUa/E=;
        b=b0uC/O9RC4y1YWNdynzzxYRvys2IEt6N0X/B9TXh3Oyds4U4TX36dYV0Q0aMGWj+Zu
         0MwwflV9n89LTFTqqk0/jbBA8kzN7G3pVhP4SHCwIAX4+USThWq3Iln7hdNGXUmRkJWN
         KWpmx6tIZQIoyd6CFxtW/NqJ90mq6v7gLpSIVV+UFIS6DMznn91kIo+PVw99tmDTpz1a
         mIHKF6h6lh8CJZPkaQx0y+V/uTj0QakXqPlB1HR9rC168SfpSEfEvV8ajwXojdRjLsyZ
         gGS08Jdttj0H9+kRH/Apdis/7UM84bZKMDKmoD1JumcJCRImIPcIXWvfZowEmrVUi9ta
         6Y9g==
X-Gm-Message-State: AFqh2kogK6Y/oJHQ/0Q0z9LXFQd6o2o1dECLOAq1N2yzOPQgOcpxSC8I
	RSXUff/2tbfVJAiQBdMD9qrgNiTfw7o=
X-Google-Smtp-Source: AMrXdXuh2yovNNjv5UVvoYM/e+7h/Iek0ieIiialwMvyhKVs+SzwT0swQ1AEuy6cQUVFwCA7Y7MVdg==
X-Received: by 2002:a17:906:374e:b0:7c1:f64:61f1 with SMTP id e14-20020a170906374e00b007c10f6461f1mr11418914ejc.45.1671804839394;
        Fri, 23 Dec 2022 06:13:59 -0800 (PST)
Received: from [192.168.10.127] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906614a00b007812ba2a360sm1446767ejl.149.2022.12.23.06.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 06:13:58 -0800 (PST)
Message-ID: <cb697d4e-406b-169b-c595-6521f8481304@gmail.com>
Date: Fri, 23 Dec 2022 15:13:57 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: stable@vger.kernel.org, regressions@lists.linux.dev
Content-Language: en-US
From: Sergio Callegari <sergio.callegari@gmail.com>
Subject: Possible regression with kernel 6.1.0 freezing (6.0.14 is fine) on
 haswell laptop
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

just a short note to report regular freezes with kernel 6.1.0 on a 
haswell laptop quad core Intel Core i7-4750HQ (-MT MCP-) with integrated 
graphics.

- system only freezes when launching the desktop environment (working on 
a text console while having the sddm login screen up, without logging 
in, does not seem to cause the issue);

- freezes happens a few seconds to a few minutes after getting to the 
desktop environment (that uses opengl and composition). Freeze happens 
both on X11 or Wayland.

- freeze seems to cause data loss (system not able to complete writes 
when the freeze occurs, data structures on disk get corrupted, e.g. 
system complained on broken btrfs snapshots made by timeshift-like app).

- system on freeze ceases responding to ping from the outside;

- upon reboot I cannot find any trace of any issue in the journal;

- on the same system booting kernels up to 6.0.14 is OK.

Seen using a distro kernel, but it should be fairly mainline (manjaro/arch).

Reported to the distro, but seems serious enough to report here too.

Thanks,

Sergio

