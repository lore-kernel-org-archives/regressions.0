Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815017CA
	for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 14:33:49 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id x37so17872528ljq.1
        for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x8PA7JqyJvYT3pyzInTP/rAu2qw/ZQ5FitjJHrmpwio=;
        b=OBxN9I+tUtzcJt+aPBELswKvbJVQPtqCvmbYeprUDNIxm2u9PFDQOMzODZJxbFe4pt
         CVodofu8aGCFE4+ebxzHdTDcL3BKtf+n+x5H2e3pPlFyXqZR1V+zGipfXZBHgA02y4HZ
         zxP8RoHVEFhb2A8OGt2aCpp1ooT7IlbgPBDGFMultFvHQ5oebF4A9BOvBHAx7IxH0fyF
         ZYBLj4vLFiuTaHuDEvus5dovxqrZB9yy4iG/jJCPhL4fzMPzEJDGcRlKCu99AgE7Go86
         OxguV/mZrvTSBDVzq+/aGTeCnAfUAvJc4Sigzf45xKd6YJIpLqjoo7eosE+eKz6AH8jZ
         Jnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8PA7JqyJvYT3pyzInTP/rAu2qw/ZQ5FitjJHrmpwio=;
        b=z20vZ2EGW9EsQUIYwYUyYOTP17okYegO8jTrR231KJEYo+3t5LXM+WI65PjtID+npm
         yPelr88l77QrLYZ69WUrg2EeTDKlrAKdlpYhrYlRwYU8Qo0Q0UssW9JoJYOmuAnD5Neq
         xnvU3iAm2tHQ9Ta0aVYO2UtlHMqWNiKTGi1W5K3Hyw3DKTyWTLfmwe2Y6z/fsfehW3Og
         lyiFP1508yqgqz4+H63vU8PhRpy4ZWA0Nz/Dfi8J/OHWGkBkvLJZJqpEAmPlmCpXHBiI
         aCEkREggdcy+dQ+qrNSbA96xNjwv/dzUQBFV1rajLDj8cLkE4QKzJzyv0LIrla3psgQG
         zoow==
X-Gm-Message-State: AFqh2krM8zOMxl/4PeqLFahS9xeQ1/S9VF7VFR6AALCEdSF4+mKgbkav
	SGhhEdsJc3tFWXFRe9nIRXFFTVG70Eo51RJledE=
X-Google-Smtp-Source: AMrXdXu65mziylIpDfXKz7w02P1kxBPLdYMvXoDrYO/Hjz8trxzad5XgunY01fNdq4MPR+io8z62weBOQEqRPuA8uXk=
X-Received: by 2002:a2e:7a0d:0:b0:27f:d911:acf9 with SMTP id
 v13-20020a2e7a0d000000b0027fd911acf9mr365016ljc.23.1672497227627; Sat, 31 Dec
 2022 06:33:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALeDE9O1+qgn_9z=zTVKbWx3FphEa4y8Dn9f5ORoQgW_gL1dqg@mail.gmail.com>
 <d88f4aff-45ad-db10-ada3-f7f5b34a6620@i2se.com>
In-Reply-To: <d88f4aff-45ad-db10-ada3-f7f5b34a6620@i2se.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sat, 31 Dec 2022 14:33:35 +0000
Message-ID: <CALeDE9O_qX_Gu1vwCLW_PbMdgnSoHTA5LhxYQrsUqwGHRwv-Eg@mail.gmail.com>
Subject: Re: Regression in brcmfmac for 6.1/6.2-rc1 for SDIO devices
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Justin Forbes <jforbes@fedoraproject.org>, regressions@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, 
	Arend van Spriel <aspriel@gmail.com>, "Ivan T. Ivanov" <iivanov@suse.de>
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

> could you please provide a "bad case" file list of all firmware files
> for the Raspberry Pi 3 B+ which worked before Linux 6.1, so i can
> reproduce it?

What do you mean by the file list? We're running the latest upstream
firmware, we do used compressed firmware but that hasn't regressed
with any of the other firmware, this is very much brcmfmac. With the
same firmware it was working on 6.0.x and reboot into a 6.1+ kernel
and it stops with nothing else changed.

> Also OpenSuSE seems to be affected [1].
>
> [1] - https://bugzilla.suse.com/show_bug.cgi?id=1206697
>
> Regards
> Stefan
>
