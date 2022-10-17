Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435C910F7
	for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 09:45:58 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id i3so10556214pfc.11
        for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 02:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ij2MqIqqwZglpWFium1q/eiumGD0QHeuEcZL1dHqOdE=;
        b=pBvbWdxZOLgKquczqWTjMaAuF7pefRJ8rKA9/4b59V64mTvs9utVBkaYKe8ofbJYFG
         KRM4Zfiljs8EM+y4kMF7WEBK+DZF6LoYR1+2wk4VcQRJPssSDfXnO7j4iXaiEwD7hRVs
         UmCXir9FJJGgq3kt6xwN32n0e6cI7UtRTFy9ZauZRukPOsfgJLkqt0fHtmMj2psvB17a
         oEbe5wtg7vtkZ0v2KqjZp2rhsx1YX2cvb3RCtEixptztuT2aJaFjkb9FNZk31NLAsTfq
         bcmxFzKk2BVNWNRENBNQi/wgEMjDf5PxX9lrKwvvRmMZxMtUfv73YBf96JXYP0buK7mF
         LKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ij2MqIqqwZglpWFium1q/eiumGD0QHeuEcZL1dHqOdE=;
        b=Lw7VoGgOeUG8hQ3tNeZD41U5AzLMQXV2IzEzrXVVxAFRBsJLtfZ3+fD4l5lqOu6TZ7
         aGpcfwwoTyEbynjSYkrIeeadDtEXchQX52+jZj/w4r4M91w9y0PvLBU+Rj5jZoywQVJT
         DQoBcxY7TGpWS/gaenaTVL0nCmA+LuthIGOuQY1Jg3el5C20lVFGH39xaZZQkwobAuPG
         jJb1vkeEr/otRmgWFRql5bvoUIyeS+LTWlxUfQc+eQicPBmN9ZFL8nE9eBo5iq59g9gl
         5D1mGNZgJF5MTKQ2tBptvZAUvat+Gmfov4znl28rgfS+YxePQGnwaDMO5dcKs0kKHFnk
         yZ/g==
X-Gm-Message-State: ACrzQf28xKyym0JeLgpi+xothvw7rnShLNypM5g6vMQ+nNrUYKzOHoOL
	68HAKl9bv2oAmUercOvWymQ=
X-Google-Smtp-Source: AMsMyM498YR1rvBNOFLBTZNic6vYa3YUPVxAysTyqkvq3/WIZ4AhK27rpEXDyRWxjrcXJeLONPnO9w==
X-Received: by 2002:a63:6bc5:0:b0:460:bd9a:64b8 with SMTP id g188-20020a636bc5000000b00460bd9a64b8mr10164303pgc.257.1665999957727;
        Mon, 17 Oct 2022 02:45:57 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-30.three.co.id. [180.214.232.30])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm6181082plb.77.2022.10.17.02.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 02:45:57 -0700 (PDT)
Message-ID: <c5980bcb-f345-ff2e-a29b-75e53a6b8708@gmail.com>
Date: Mon, 17 Oct 2022 16:45:49 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>, regressions@leemhuis.info,
 mirsad.todorovac@alu.unizg.hr
Cc: linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com,
 regressions@lists.linux.dev, srw@sladewatkins.net
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk>
 <2d1ca80c-1023-9821-f401-43cff34cca86@gmail.com>
Content-Language: en-US
In-Reply-To: <2d1ca80c-1023-9821-f401-43cff34cca86@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/22 19:21, Bagas Sanjaya wrote:
> 
> No Verneed warnings so far. However, I need to test for a longer time
> (a day) to check if any warnings are reported.
> 

The regression still occurs with this patch applied. Let's see if
reverting the offending commit helps.

-- 
An old man doll... just what I always wanted! - Clara

