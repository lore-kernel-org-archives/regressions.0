Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A93B2F2D
	for <regressions@lists.linux.dev>; Tue, 27 Dec 2022 16:01:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i15so19582076edf.2
        for <regressions@lists.linux.dev>; Tue, 27 Dec 2022 08:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iY8iXopDRSVyXmalVYnXSEmT3eIhTZabRznlhejI1tM=;
        b=Ejw0F2i3PvVjE68XLXRKyjWrXFhqPKIIP3OdfBgmBX/V+2DlAaXmNHGdYFSiDky/fH
         8ciTGL9WNr95NcMnrSxjHFAIsOEagPTZgq38V9S/UR5+bgL6Fpgm8lCmNs8hRY9s8oqK
         OpgVSaKnUnId0ACPwuTUNwCn/M0l7bShBVsyInfsO/tbcL8wyfvseH7InJuQfb08fABv
         6ueLAoi9J0TZJ50ZP2kcv2gE7JNAUYguxoQC+5QY+FNl8hsSAUdzDuj0+Mty0IppocDi
         IFyR3eavyM8VRVahRp6YUutNiPw+6wV3D6WhxCvkBSTp3GMOCqxjUmMof/Fp9Xy/egqG
         cJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iY8iXopDRSVyXmalVYnXSEmT3eIhTZabRznlhejI1tM=;
        b=ipOvNAJvaTE2IeLJOzBuwVdbCaavBo0y22NKxIldNstmVhGcuhG0rtdCq2zwzzZxaO
         NdYQQdrWRsiFFmoL4JZI5OP4qVBdBwzgMfEoVgPnCLhS9/cZNvuLDZM34CgCBnXa9mmg
         PwbAHNiVVIygA8IffCumOJgQ0DrZ1iH7sZBR8yVGGFy+9OxHPTy0ef7HhZq/lzZYMFh1
         aKQO8AQXiQ+u+xxoVwG+Uru5bgfuRFMD5ym5MPRr6Zt+RKfpHdogO7u7Q4hmfKm/wydX
         p1v9meFx5eCw2CDbBQyDRjjj0Xs6yZeKi9vabNPgt4qmzNNqHzXqsZzxKEtm4zUq4T8c
         xmXA==
X-Gm-Message-State: AFqh2kowPAnv2lQdny0vOi7w+jl520P0jJoZS6qsMsAgNJSeSqC4H1us
	ABurVzeXHNfFutnsvBkJh9A=
X-Google-Smtp-Source: AMrXdXtc35Hnk2kbuAjp4xr9ish/Zx3MfNPiFFMS8iQpF4r7F32lOoG7dx+UEP/KRvvjBLGyfY4JSA==
X-Received: by 2002:a05:6402:1770:b0:461:8be6:1ac5 with SMTP id da16-20020a056402177000b004618be61ac5mr17047329edb.3.1672156862558;
        Tue, 27 Dec 2022 08:01:02 -0800 (PST)
Received: from [192.168.10.127] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id h25-20020aa7de19000000b00463b9d47e1fsm5989995edv.71.2022.12.27.08.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 08:01:02 -0800 (PST)
Message-ID: <693990ed-d0cd-a57c-c71d-116a8fa01e06@gmail.com>
Date: Tue, 27 Dec 2022 17:01:01 +0100
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
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <cb697d4e-406b-169b-c595-6521f8481304@gmail.com>
 <Y6W6Qxwq94y9QGFl@kroah.com> <38cd1c38-b469-f25d-369e-57877865fdbb@gmail.com>
 <8c3034f1-bedd-0e43-46e5-1e1fdca238a5@leemhuis.info>
 <18216b2c-d5f8-ada5-6110-192895772cbf@gmail.com>
 <39289e9a-2afa-1d1e-dda0-7958c66c73c2@leemhuis.info>
 <0f6e9e95-af42-fbdd-7efb-50cf3b1ba890@gmail.com>
 <9b979a1e-e876-6b6e-ea3e-90004b69476d@leemhuis.info>
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <9b979a1e-e876-6b6e-ea3e-90004b69476d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27/12/2022 16:28, Thorsten Leemhuis wrote:
>
> The fix has to be reviewed and merged to mainline first. That will take
> a few days -- or more given the time of the year. That aspect makes it
> even harder that usual to predict how long it will take exactly; but I'd
> say 6.1.2 is pretty unlikely at this point.
>
> Ciao, Thorsten

Just checked and found out that the patch has already been discussed on 
linux wireless, both in the original post and in 
https://lore.kernel.org/linux-wireless/Y6rffzYy5hgIQKSE@localhost.localdomain/T/#m9a15f5ce5db2b585e4d9b6f708e01c58dedded8c, 
so I am sure they are aware that there are lockups without patching and 
that the patch will be reviewed. Also good to know that for now the 
lockups appear to be limited to machines using mt76 wireless.

Thanks again,

Sergio

