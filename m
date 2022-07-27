Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E244E320D
	for <regressions@lists.linux.dev>; Wed, 27 Jul 2022 20:04:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d8so25831271wrp.6
        for <regressions@lists.linux.dev>; Wed, 27 Jul 2022 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=sHSYPh+AzLsps9tMRYbaXtGOiqgNNXGNW2LnpSImx9w=;
        b=gdfObkFU00csidxmtnvdCsZOg+Utjxek0TzgURzVqzjZZNEYByr525hTX0retfxoBt
         Pf7vF6rRabT1BzLjSJgV9I0+zl5Gh+VIJX4MNQFKKQP87uqmqvrIpOXqT+STaXjbtS2x
         oqqQYlmY8PvUEe3FTTz3MFAByTMedA2uWEvDTtw+vMzMv7xgNzN1pOfi6cd8vGXz4w79
         jaQE0rtyEnDQT7VCQIaN35jwIxaw8oKys11iofrqnjuirYj9wU8ePWHiOmeFNtt3h7gN
         QRCMofJey4qXd3haYwVPmtYxvSzc+kcGORqaSp8bnR+P9NeJf5TxsPtMtGGJMeLXA9gM
         829g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=sHSYPh+AzLsps9tMRYbaXtGOiqgNNXGNW2LnpSImx9w=;
        b=T8MmtBPrNEZLgBWXI4lA6klCkwpOfoyOIBYEhUzVcddjWpsKlJGrUqGK9wNJ5+3vI6
         9zc1AuggeBQaY6LE6xlQCMWXqkENU8NLmNitTMBowFqqQksMJy+YXS4YA3d6Fzqf7jWI
         BrkqEsOk+hcfRXMRXdE5IX008Xrwwr3DOhq1xQtS4WfXC3x9f96/clg2CwSTltggYGNU
         aF+LXdEF6xozfrGcKXRTDj/TJvz+RzdS7ujR0BEHBUSZWXqaGxIeBrB6oZEzwcEm9rgj
         aMEJR4e6hDnG9hVgWRmdgW0sIjCIumW37ZBPGNLx8mi8RtvNBJ707zyDfANf2bFoxM68
         EVBA==
X-Gm-Message-State: AJIora/OCcCr9UQKkYyNdFK4VoYxflRnjTPYltSsIBLtyBXxRv2hJzC4
	+8ZclBwMe6MaCZiVnC4+zFM=
X-Google-Smtp-Source: AGRyM1vT0QKNPP3iCub94Ad7gX8jOUbrbOyQltTjzQCrW3c7Sc8OGcbJKhSbOLboO7IACvqCN1fllw==
X-Received: by 2002:a05:6000:1549:b0:21d:bdce:1d01 with SMTP id 9-20020a056000154900b0021dbdce1d01mr15880551wry.373.1658952274837;
        Wed, 27 Jul 2022 13:04:34 -0700 (PDT)
Received: from [192.168.2.21] (178-83-161-42.dynamic.hispeed.ch. [178.83.161.42])
        by smtp.gmail.com with ESMTPSA id i3-20020a05600c354300b003a2e92edeccsm3717174wmq.46.2022.07.27.13.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:04:34 -0700 (PDT)
Message-ID: <fda96c5c-9007-4147-3be1-8c9deca0442c@gmail.com>
Date: Wed, 27 Jul 2022 22:04:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Clemens Leu <clemens.leu@gmail.com>
Subject: Re: Possible regression: unable to mount CIFS 1.0 shares from older
 machines since 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c
To: torvalds@linux-foundation.org
Cc: davydm@gmail.com, linux-cifs@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 regressions@lists.linux.dev, ronniesahlberg@gmail.com, smfrench@gmail.com
References: <CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHk-=wjSBvRk-ksUBOiQzJd=e19UZKvOSZs1UHahK5U0QVh6RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all

Here follows now another practical reason why it is at the moment a 
quite unhappy decision to ditch the NTLM/CIFS 1.0 support entirely.

I am on Kubuntu 20.04 LTS and the access to my Apple Time Capsule worked 
fine. This changed when kernel 5.15.0-41-generic was installed some time 
ago. Since then I have in dmesg the known "kernel: bad security option: 
ntlm" and "kernel: CIFS: VFS: bad security option: ntlm" messages and no 
access is possible any longer to the Time Capsule.

So it looks that commit "[76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c] 
cifs: remove support for NTLM and weaker authentication algorithms" has 
completely broken my Time Capsule access.

Yes, I know, ntlm is more than 20 years old and a quite insecure 
protocol. It is absolutely understandable to disable it as default. 
However, it should be also regarded that there exist companies which 
decided because of narrow-minded reasons to implement only the old SMB1 
protocol also on not so old hardware. Apple is such an example, they 
really implemented on all of their Time Capsule models (which were using 
a special Samba implementation) only the stone-age variant of SMB/NTLM. 
This is true even for the last 2013 variant which was discontinued on 
April 26, 2018. Apple could for sure support a more recent SMB version 
but they didn't do it most likely to make their own AFP3 protocol look 
and perform better.

So the alternative would be AFP in my case, unfortunately it's not so 
easy. While we have thanks to Netatalk a rock-solid AFP support in Linux 
at the server side, this is unfortunately not true for the client one. 
The corresponding "afpfs-ng" (Apple Filing Protocol Library, a client 
implementation of the Apple Filing Protocol) project is unmaintained and 
dormant for years.

Long story short, the current situation in this topic is as I said quite 
unhappy. While I fully agree to disable NTLM/CIFS 1.0 as default, it 
shouldn't be removed entirely. Maybe it is possible to enable it only 
for accessing older network volumes/shares while on the same time block 
the possibility to create insecure NTLM network shares? I am aware that 
the risk in enabling this old and flawed protocol will be my own 
problem. I won't complain if I get into trouble because of it. ;-) 
Unfortunately I have no alternative other than buying a new NAS or 
downgrading to an older kernel which is also not a really practical option.

Whatever, many thanks for all your great work!

