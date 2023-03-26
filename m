Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605020F8
	for <regressions@lists.linux.dev>; Sun, 26 Mar 2023 13:24:00 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id o11so6041426ple.1
        for <regressions@lists.linux.dev>; Sun, 26 Mar 2023 06:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679837040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pnOOlLKoWlVB67gp3RPUD05wT//LBY3yFpES74W1Vkc=;
        b=qJ0qSreIpqg7n1M2RJjBDhJZNct/hh4eDFZw5tBFyTNWY3W/g8AYQZSPdR0vIiFA8i
         JCA/D3T2q8BkY7jKPCRaJRH6ne7OzfhKZ18nN4jPztDcLZQASNS1YOP78h9cxdwHftKN
         pG3dcGw8VKpbZDXsBClvssSgdr+gusQnrJLtld9M0u7ysTwWD99Ut8cT9xepT8G7cs+v
         yyd6j85VBKXGPGe96u6zafNRWT9O3yQ9BsmY9I8KISTqEVhIVMNxxyiNjFwr6TCAuJnv
         wArLHUpczHBiNXymvTma3ovhG+iAtWm1+dIyGCM8hpSpMy2Rvjqk27a9Ri4kw3d8PYLj
         OWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679837040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnOOlLKoWlVB67gp3RPUD05wT//LBY3yFpES74W1Vkc=;
        b=ACH1qPG82HAyaA0MZDEkkTcj/9Fbr1P42GjhK7rY8o/bndQu+zOnbB4VvNINppRgvC
         UB8XiOBPNZf7yedgVyBiI9aS0pGnz1Wj5Hn2EqM/1wk8RiUw/w4YDu9THrPpCG0CMzWj
         5JdRDUq5DnBIv/cqBpPrAmlvEgqyMbJ6E9I4MNFIyKb5Lip+kYTdTFgFLmIpKH0p3rk0
         w2ruoqdBox5UnchB6L+zMjLGMhGPV+hAamayxLK06VwG11Dl+kaxav2Nckctm+Jam3qc
         comyb0iS2YYebmBb7hW4LvGBK3UrgE5et7ILFKuM7QMV+WSb6uMt7VyeMGnNu+XxKkHq
         FuLQ==
X-Gm-Message-State: AO0yUKVAsQmef+ZXiN9BQSdW8I8YZRS0JzDsSyBesPNvNw2hdQB66Agd
	gjCCrUXA568eKwt365EcDY8=
X-Google-Smtp-Source: AK7set9OzCDMKxr2gAfR4Tvv6pTg1Zs5M12Fp4wZblK+PYXBW0DBvuChv43wUrBkPscskOMgLpZZeA==
X-Received: by 2002:a05:6a20:8b14:b0:da:fa65:cd89 with SMTP id l20-20020a056a208b1400b000dafa65cd89mr8874490pzh.9.1679837040117;
        Sun, 26 Mar 2023 06:24:00 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id b23-20020aa78117000000b005ac8a51d591sm17108200pfi.21.2023.03.26.06.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 06:23:59 -0700 (PDT)
Message-ID: <d14fb08c-70e3-4cc7-caf9-87e73eab9194@gmail.com>
Date: Sun, 26 Mar 2023 20:23:53 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: kernel error at led trigger "phy0tpt"
Content-Language: en-US
To: Tobias Dahms <dahms.tobias@web.de>, Sean Wang <sean.wang@mediatek.com>,
 angelogioacchino.delregno@collabora.com
Cc: stable@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-leds@vger.kernel.org, linux-wireless@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <91feceb2-0df4-19b9-5ffa-d37e3d344fdf@web.de>
 <3fcc707b-f757-e74b-2800-3b6314217868@leemhuis.info>
 <fcecf6fc-bf18-73a0-9fc1-6850e183323a@web.de>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <fcecf6fc-bf18-73a0-9fc1-6850e183323a@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/26/23 02:20, Tobias Dahms wrote:
> Hello,
> 
> the bisection gives following result:
> --------------------------------------------------------------------
> 18c7deca2b812537aa4d928900e208710f1300aa is the first bad commit
> commit 18c7deca2b812537aa4d928900e208710f1300aa
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Date:   Tue May 17 12:47:08 2022 +0200
> 
>     soc: mediatek: pwrap: Use readx_poll_timeout() instead of custom
> function
> 
>     Function pwrap_wait_for_state() is a function that polls an address
>     through a helper function, but this is the very same operation that
>     the readx_poll_timeout macro means to do.
>     Convert all instances of calling pwrap_wait_for_state() to instead
>     use the read_poll_timeout macro.
> 
>     Signed-off-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
>     Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>     Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>     Link:
> https://lore.kernel.org/r/20220517104712.24579-2-angelogioacchino.delregno@collabora.com
>     Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 60
> ++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 27 deletions(-)
> --------------------------------------------------------------------
> 

OK, I'm updating the regression status:

#regzbot introduced: 18c7deca2b8125

And for replying, don't top-post, but rather reply inline with
appropriate context instead; hence I cut the replied context.

-- 
An old man doll... just what I always wanted! - Clara

