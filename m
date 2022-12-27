Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6CE2F2D
	for <regressions@lists.linux.dev>; Tue, 27 Dec 2022 15:21:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id fc4so32538449ejc.12
        for <regressions@lists.linux.dev>; Tue, 27 Dec 2022 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhwqyIpFRJ8Auf1m2ZQmw8vhUt+lHN0JSOypFXT9tVk=;
        b=AGE3W/GLOEsq4L9S0zqECsM78K/Ti2v8ksmDKctS4J0C5754c7TldJXrVDxAvJ/JLi
         rETl7iMjwatFp6W5Ri1OiCWAqrEfZo35RfYahVAgY/OBnDkzp2+YOIAuzjOqg1iG5Ber
         q5/pLxRecfpGqjhn65I+UF+NR6DrnovPdHIVMG5l21seSAEa+mQCDZT+j+2EjcV+9tEY
         gjIYNkj+LWUQZHrIa0ud8kE8y+O7LZ/IKNsUPII39CMNlSsG3nvC7FxWwhxAiPQTfv6K
         8vEFV+j4sOHqZHSGF6j1qY9mw2r4+nJ8+WEz1DHK9x++w61nZCb3YdH/kvUwpy3aHjQb
         Naiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhwqyIpFRJ8Auf1m2ZQmw8vhUt+lHN0JSOypFXT9tVk=;
        b=YLsvfVMAU0U8haVsVivlbThg5PGntm5urL89SzE/dV72AFlzdkE65BFabAkdJjHlTX
         ApVUOvWk1wHCtDk2Jrsat2RSjH5zM+yfi+hDteJA9tSBbQO4421Kfbr0Z++GCfjNZU1v
         U67hS4m5oi5gC1kee68whp/JKpB1wqYgSKGrnFKTENohE70blvxGwVy18RqR8KNh7SYq
         jHRA34PNi5l9lbraQ1RazGVNMLY583X9dFSmwEH3YQ0l9T5IZ4LemqUT3ulScTS5lM7S
         cnkVZrGlVsZ+z8iYngoRw/CgpKZppaGl6saKAviFEUne5c6PrmqIswD+5Da/bA0/me/P
         9Pwg==
X-Gm-Message-State: AFqh2krqH57H+I8FWS/fs1/dVsRCd8JgEZMtmzuQV4/msicnXNfzS9DZ
	oCxN/Pet/cY03z4/rFb39e4=
X-Google-Smtp-Source: AMrXdXtk01ZPxBN4hkI5GFsUjMvuUoiPYxuRNXbm3Eg2yIgtxKZFwFnVEp272hDZa//F4JIPh+Zd6g==
X-Received: by 2002:a17:907:a643:b0:83c:7308:b2ed with SMTP id vu3-20020a170907a64300b0083c7308b2edmr18793284ejc.17.1672154487213;
        Tue, 27 Dec 2022 07:21:27 -0800 (PST)
Received: from [192.168.10.127] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906145b00b007ad69e9d34dsm6198623ejc.54.2022.12.27.07.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 07:21:26 -0800 (PST)
Message-ID: <0f6e9e95-af42-fbdd-7efb-50cf3b1ba890@gmail.com>
Date: Tue, 27 Dec 2022 16:21:25 +0100
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
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <39289e9a-2afa-1d1e-dda0-7958c66c73c2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27/12/2022 16:12, Thorsten Leemhuis wrote:
> On 27.12.22 15:46, Sergio Callegari wrote:
>> My issue was
> Likely not important, but FWIW: I assume you meant "will be" here, as
> unless I'm missing something that patch is not even in mainline (and not
> even marked explicitly for backporting to 6.1.y; sigh :-/)
>
>> the one described in
>> https://patchwork.kernel.org/project/linux-wireless/patch/20221217085624.52077-1-nbd@nbd.name/
> Thx for letting us know. Ideally you want to rely to that mail (see
> https://lore.kernel.org/all/20221217085624.52077-1-nbd@nbd.name/
> ) to let the developer know that their patch fixes your problem.
>
> Ciao, Thorsten
>
> #regzbot fix: wifi: mac80211: fix initialization of rx->link and
> rx->link_sta

It was actually the arch developers suggesting that patch. I have 
already informed them that the patch fixes the freeze. Will ask them to 
report the finding to the patch developer. Will this be enough for the 
patch (or an improved version thereof) be considered for mainline and 6.1.2?

Thanks!

Sergio

