Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933D2DDB1
	for <regressions@lists.linux.dev>; Fri, 19 May 2023 13:56:49 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ae3ed1b08eso33167985ad.0
        for <regressions@lists.linux.dev>; Fri, 19 May 2023 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684504609; x=1687096609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kjx7zMz+PLPU+vzhqT3/wZhMtjfZaSMHpTNHBjtGTg=;
        b=TY0wzD3Ohj62PidnLZ6GCyPoGXmHT9H61FisfKB8pOlFmjjl7lwc9XDc/UHqskBmJI
         +Xj8P4zGVUm+NYxFx208kbFWhctob1zWwcmqjgoVvCUdmKFE7DT/jR2q/cDGEpT6moCy
         eH/qAhfDvMox23rE5PBXKbQhfvJ1sUv5tvglgARQjAN7zdA5frzbcrVTqy+SBOwoovOg
         ftmWWSoyUDcA701elQBPYi80uxeSN7SmT+BU97P3qUm/I/j9Ye4ugH7x6hcR+7CcMqlk
         V9RCHT59kv7CFHujZsFctv/jDp+LZQ+zQOLZskcktdDc1egMrH70GWVuFBEOt3ZojE6U
         QH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684504609; x=1687096609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kjx7zMz+PLPU+vzhqT3/wZhMtjfZaSMHpTNHBjtGTg=;
        b=UnuIXgOytmLyzIGJEWDy37AAk8fySdb0bPnMzMX2dehrguZaz+TJSYB3Boy7nd3y2p
         rl/L+m7unliIrqnvCt3Baep6bPI/KQOKFcMEdZ3x3yDUOUxpMVyJYBGqNZiftBvle9WD
         Zt74U88nOAq2154drU2U3BQW6Th4q6kA1uZpYMgxVrrjXogo/xoZItTjk2rRi6upsE9s
         DS4an8u1pzAennYWlv5Yrgp1gpG2W0pCEUgYbl9iRRi3NRjiSRxYqGuhzshjIWbUzdpT
         THOOPFO5MYekHo6I/q0HUuJ1X1gt64vXepZR0vqd00yuL4w5z9GWW1Mj3DP42LpwMnEL
         szTw==
X-Gm-Message-State: AC+VfDwVHmOcTTONdEEHZvBzMZV4oZby/EZux8ylKXihIZElaqYQUXcX
	X9mm8E2vx11aH8dXFfKI9SQ=
X-Google-Smtp-Source: ACHHUZ4XUvfR0MKHNn2zDk9Z/od/cQuR/IYdbqtjUpVefshpyTjYXUPEYg3O7tq74M8KzWJhUV/5dQ==
X-Received: by 2002:a17:902:ecd0:b0:1a1:b3bb:cd5b with SMTP id a16-20020a170902ecd000b001a1b3bbcd5bmr2662421plh.62.1684504608941;
        Fri, 19 May 2023 06:56:48 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-19.three.co.id. [116.206.28.19])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c21300b001ae626afed4sm1467376pll.220.2023.05.19.06.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 06:56:48 -0700 (PDT)
Message-ID: <31454cb5-0ca9-2179-f9da-02a18722eb8b@gmail.com>
Date: Fri, 19 May 2023 20:56:43 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: ThinkPad L540: suspend not working (deep / S3 / standby,
 regression Linux 4.19 -> 6.1)
To: Hans de Goede <hdegoede@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Input <linux-input@vger.kernel.org>,
 Linux i2c Devices <linux-i2c@vger.kernel.org>,
 Benjamin Tissoires <btissoir@redhat.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 kolAflash@kolahilft.de
References: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>
 <2d7ee116-5985-021f-0dfb-b0485a465c86@redhat.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <2d7ee116-5985-021f-0dfb-b0485a465c86@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/23 20:46, Hans de Goede wrote:
> Hi All,
> 
> This looks like something for Benjamin Tissoires (who will
> be available to look at this in 2 weeks or so) to look at.
> 
> Adding Benjamin to the Cc.
> 
> In the mean time passing psmouse.synaptics_intertouch=0 on the
> kernel commandline should restore the old 4.19 kernel behavior
> of simply using the touchpad in ps/2 mode.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

