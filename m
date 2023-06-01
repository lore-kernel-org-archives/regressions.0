Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AB933DF
	for <regressions@lists.linux.dev>; Thu,  1 Jun 2023 21:19:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so13239825e9.2
        for <regressions@lists.linux.dev>; Thu, 01 Jun 2023 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20221208.gappssmtp.com; s=20221208; t=1685654346; x=1688246346;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of/XrkXjYj+o/AeSmwOwIp8GlnWTvjMR5t2AdN/ZBRs=;
        b=f4fU5sUN4379BHHJ5FIiRW3x0J29UE+nOp4gBGoFq5nPWGQu1up+enM0DTwadk/JvA
         NfaWedqcxmaT7A1G3/zLjM9INVmZiesNI0C+Zz3Xuf4CH1EInUukVeEYL3I/tYvxwT/G
         QxaZY7ItWUpJIAwsbElGiiXtqpYCZTjNe7Ud6s088uD08u61WBL/xbsNCZHJq3jZJyUI
         5eNewKDYl8V8SIkBxLEduGNY9csiuWtKic/mYhnLelm7Ltk9YHFtIAhJt9cyHuvjdxix
         YnuSmXWkCZdIn8H3iBKp8YCAYm4ABRC0gKw7OJxwfTHzn4EYThXLaGdwJ1JrhPTAoMDh
         Gpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685654346; x=1688246346;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=of/XrkXjYj+o/AeSmwOwIp8GlnWTvjMR5t2AdN/ZBRs=;
        b=KixVh72AaHAjsSs3LvqSHIPzOsJv4twqGQD+mstal4kyJZdceyzFpgVT1o2ZVj0Swf
         SkdMvM9gCLbs75JbhMyvkBEKgubqS+Kdx1PkbXVPk5niadAHdB5PUIQqsEVvUPrTsS+V
         XkXlnbpoXk4vn8JrMoVz/cD6TrQZ7qX6Du5B7EBExBCh+ewD1v1fyqcDy83DYywaEdUB
         1452B2864VWYYX+TKleHD23bTRAN5f3zd23cq/U0nGExkRYxldWljp+H/KdP5FkdUUe2
         vcwXOxQj8DqD72Dt9zt8BF/UwxgdmqBOwPMSyd77xqOD/E4XYzHCz4oZRlCdHGt0RMNJ
         BaaA==
X-Gm-Message-State: AC+VfDy0ub9qeNoEw6hNkm9O6zIZ1kspUQRTz5ygFRY45Gwoa/FeDzwE
	PPciDsmEu+IvH3NSUACwW4GwoqzAXzveyUZghVE=
X-Google-Smtp-Source: ACHHUZ5GQ6DQe4pOcH7HZpe3BSlh9JLpN/xfx6XaRRZ7dknhrzPa+3roiiN6P3H3nrJzdCB88leFVg==
X-Received: by 2002:a05:600c:224b:b0:3f5:ff24:27de with SMTP id a11-20020a05600c224b00b003f5ff2427demr399052wmm.32.1685654345915;
        Thu, 01 Jun 2023 14:19:05 -0700 (PDT)
Received: from ?IPV6:2a00:bba0:120c:9f00:7a8e:8795:650f:7c4e? (2a00-bba0-120c-9f00-7a8e-8795-650f-7c4e.static6.cust.trined.nl. [2a00:bba0:120c:9f00:7a8e:8795:650f:7c4e])
        by smtp.gmail.com with ESMTPSA id f15-20020a7bcd0f000000b003f4272c2d0csm3440377wmj.36.2023.06.01.14.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 14:19:05 -0700 (PDT)
Message-ID: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
Date: Thu, 1 Jun 2023 23:19:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: regressions@lists.linux.dev, paul.kocialkowski@bootlin.com,
 jernej.skrabec@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
 linux-media@vger.kernel.org
From: Martijn Braam <martijn@brixit.nl>
Subject: [REGRESSION] breakage in sun6i-csi media api
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

It seems like this commit:

media: sun6i-csi: Add bridge v4l2 subdev with port management

Has changed the way the media pipeline on a64 devices, in my case the 
PINE64 PinePhone works. Since this is an API towards userspace and 
there's active applications that use it I think this counts as a regression.

#regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43

Greetings,
Martijn Braam

