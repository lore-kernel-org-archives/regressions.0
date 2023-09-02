Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634215676
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 15:50:51 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58c92a2c52dso310697b3.2
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693669850; x=1694274650; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pRMCIrxRKvjA3fHuNLxm+TCxQxtaqWRK8gpzuCewrLY=;
        b=VF+XiJQkzQ7xm/ATpi5mtJVJAKE4K8zoLsCk5gt5Z4sqxalLTCqFlurexCJ/rgQoCz
         DPUlldx2NOy157GGHWNT4Yfqn7Zm6riLPPcMAGV5feu7vT18lserU8mUjtIbx55a/5HC
         IqwioKD8DICFZBBDqLNyc6KU9bd1FDg9W04YlnF82WchMb1iNo/+mbU7i6c5xLWCcvil
         w+4ICCmW0aqXKNzguFh6WuK2IxeppmTE4WwWNs9IkrrRT58pMklaob6OKo6jzLVJb8D0
         B9v4LvgP0zbcZTvORJn2/S74JvszU2FUrOXmRStd237SduSWpvcakTVghCXhDR69y1TT
         Xg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693669850; x=1694274650;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRMCIrxRKvjA3fHuNLxm+TCxQxtaqWRK8gpzuCewrLY=;
        b=Ony9mpfalIYajhaSSstQoMp5QSC+gG5x5RakDTyzjHO2kUdzhGHjYzIpvJBgU11JEL
         rC8Mj+LbHqWVNWXpqkotE/GIad1s2DsOXLM75p9tYdOb1X+yXrgen7f3jpc+I92+CF0D
         0HUNmvIgbWIkZmrYo0Hl1lu4mzhwbeoCq94rwu1PeGKE9r8thPiL9BOIYaWi7Xo9w9En
         bpPC31mKeqs6SjZChOVSV2oHxl3rHG5pB7Ivdw8RpRyRSUdIUwxSn126xLiXvuLlJfpM
         34W9/PQcgi+iGpy/UcJ+zJDjKGZ0nZDlkYSW8bm98TGY5CxjLnkj4yD2tylx3LtgBdlb
         8BCA==
X-Gm-Message-State: AOJu0YwwlJchFpeFggXThztr8AWA2qfo3ZNx2wA2wPEuLqNoRjDGiXYF
	367dCGcE7BplXqgyfZWpSOVa+A==
X-Google-Smtp-Source: AGHT+IEkAsyisZiz8vks79pWVNznhUxJYhALx926CW/w3O1pO2fXrC4tJqmdJCpcgyPEMjj+gItlXg==
X-Received: by 2002:a81:84c8:0:b0:576:93f1:d118 with SMTP id u191-20020a8184c8000000b0057693f1d118mr6982475ywf.2.1693669850085;
        Sat, 02 Sep 2023 08:50:50 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l188-20020a0de2c5000000b00597e101dbd5sm1683494ywe.13.2023.09.02.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 08:50:49 -0700 (PDT)
Date: Sat, 2 Sep 2023 08:50:41 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, regressions@lists.linux.dev
Subject: Re: 6.6/regression/bisected - after commit a349d72fd9efc87c8fd1d16d3164752d84a7275b
 system stopped booting
In-Reply-To: <CABXGCsOM0j7ME4iUDbf5fpLMxZicXHwT9aBGWXCNWUVSPUO0Sw@mail.gmail.com>
Message-ID: <ffb3fb7e-69f-d5b5-84a2-e51595a4a99e@google.com>
References: <CABXGCsNi8Tiv5zUPNXr6UJw6qV1VdaBEfGqEAMkkXE3QPvZuAQ@mail.gmail.com> <3548ca67-ce58-3bc6-fef5-348b98d7678b@google.com> <CABXGCsOyamBvQ=Y-M9HQBTfEDfaRwGqzXqayBm7L259Q+t+gJQ@mail.gmail.com> <98eb1ba4-5bd3-ee7-1a88-47b054dc938@google.com>
 <CABXGCsOPcu8R9rpdihNR5r822FAHBZ42wBa5XUa5RDVierD_tg@mail.gmail.com> <5e4d50d4-978-ce54-e1ae-40f7117dbf3d@google.com> <CABXGCsOM0j7ME4iUDbf5fpLMxZicXHwT9aBGWXCNWUVSPUO0Sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Sep 2023, Mikhail Gavrilov wrote:
> 
> Great, this is the right patch.
> Both build a349d72fd9ef and latest in Rawhide (now it is 99d99825fc07)
> works fine after applying this patch.
> So thank you a lot.
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Great, thanks so much Mike: and Linus already took it into his tree:
ee40d543e97d mm/pagewalk: fix bootstopping regression from extra pte_unmap()

Hugh
