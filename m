Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A225120FC
	for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 22:46:14 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30e412a852dso2007240f8f.0
        for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 15:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686437173; x=1689029173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QoD2JHmjS+XykjPjXzCexgQPx0u9rmZzOabrfVfkmk=;
        b=BSqzhVOwihGPnMwm6/Md0ZmgxQ4dngXJu95Al93AGsVJ6F/szHC7orjlza0QR2XsH5
         +wTb+vYU1MkRGZvyqkootl+QCt3sLm3HHMO7zPs8Zad67wVnDEi+2Wv8dEnNViKBVS9P
         RF9YXQMm9tTNFvanrHCSLU+ncxEmFpbOBZ2K9Bb9NZBY2soPN1rX92xrVs5Opr1CyLrW
         /6PKIf6F8KVaQLx6iXlFQ04qsZSIFlzTTt7qL3o27rTdqCwNQrieLmo4dDwo0UCAhJPO
         yKom1vR7iqjLucQ3x5E04T0Yihx391cn+I6RXgzr88x4J30EfiEXOQB3mqvHPqajmH8Q
         +FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686437173; x=1689029173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QoD2JHmjS+XykjPjXzCexgQPx0u9rmZzOabrfVfkmk=;
        b=SbfhN86Oot3RsDVZltMG3SPA5WYfn2uwq+DbihZ1EramT4nneE9z41Plk5ljMXo/gW
         /HRnIksmRzWhFSFBya3sZocy/5BVs43oI8FFBSj7kyNE9v7YvQ2B+EGXnXo34Wns18+/
         qWQ3Y/dLOpLhIxh30cvre+GKKodsq0VEI5GTp6alVbw7E8/OOnIpbJzm32rjan9tiDII
         cZQNqP5VEMeGWSLPDDzz0c5ndOK0EMC+i4aCBZNEmOG7cLXGqZXp3rLTVMqflfOdqbkT
         iVWj48DsBpWFq7vtVTWqTSGcjYFlkU0wejTrkS7HGQYHOhCFBMFEMMVUbs8xPucmMN24
         Y1fA==
X-Gm-Message-State: AC+VfDzpFh0//JgMdRdoIVjgUuTgtLqMxytHkcW0dR7u8dCzi6M2K6y3
	7u6Z8/Yhgv/NlA4+7GmZeg==
X-Google-Smtp-Source: ACHHUZ6eTc2p0XNUM14Lcjh4ro3Kn6xg8mm+gl8p4RFbWuyCsAOTVHWdX9YgIUpbxXH71NfpfjESWw==
X-Received: by 2002:a5d:4387:0:b0:30e:4265:c903 with SMTP id i7-20020a5d4387000000b0030e4265c903mr1553849wrq.66.1686437172351;
        Sat, 10 Jun 2023 15:46:12 -0700 (PDT)
Received: from localhost (112.red-81-44-165.dynamicip.rima-tde.net. [81.44.165.112])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d4ec1000000b002c70ce264bfsm8096671wrv.76.2023.06.10.15.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 15:46:11 -0700 (PDT)
Message-ID: <5b48af9d-300b-b024-dd44-600562eb7b59@gmail.com>
Date: Sun, 11 Jun 2023 00:46:09 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [BUG: 6.3 kernel] Logitech Trackball M575 misidentified
To: Bastien Nocera <hadess@hadess.net>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-input@vger.kernel.org
Cc: =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <eeb19342-3499-a1fb-388f-d4670472b16c@gmail.com>
 <8941c5f2-3861-da68-06ca-adc68a37e53b@leemhuis.info>
 <8308180826ba9a5478bf568396034b8dc7fb6e72.camel@hadess.net>
Content-Language: en-US
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
In-Reply-To: <8308180826ba9a5478bf568396034b8dc7fb6e72.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/23 10:50, Bastien Nocera wrote:

> The device name problem is tracked in 217330, which I filed.
> 
> A bisection would definitely help me if you have time, otherwise I'll
> get to it, but it's probably not going to be before a couple of weeks.
> 
> You can also test this patch on top of the latest kernel tree:
> https://patchwork.kernel.org/project/linux-input/patch/20230531082428.21763-1-hadess@hadess.net/
> although I don't expect it to make a difference.

It was fixed in 6.3.7.

Thank you.
