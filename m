Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0AC36AF9
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711735574; cv=none; b=YqjCgmgliRpBRt+zXf8mE0xaiAzGsNxtR7CdUIb6WOYb4VnxdukK2u9xJHeALKWkNwU/vU0mbd1KL5b+EnpMI1GYhrEiSEQ1RPet0fZ6QzbVtoPo5tDQpiZl2uQ+Ia1EWwuSQxL/rhvaqflc2QtnXEWBOKSK+WhrOc/saj+d05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711735574; c=relaxed/simple;
	bh=R3BSlNZGjpe56WqazE4wFdBARmf3FVEmHM7BHsgVa9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ShPxQk5oTx8zt4N/k4ujEZCIEi0NZBZDdxJFW8KMW8j+yoOgl1AWHZXnFFXqnf5KbpBaQ2rySmqTi1KqY2Dp7qwqofMsxvDtAwRu5XyTJbYcQ44ZchjBoRMKIy24z8FekQsh1MiPhEGjp0RaX9a0TnpSLn/8bhZMa1ejr6WcaUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvhIcEih; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvhIcEih"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5a47680a806so512060eaf.0
        for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 11:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711735572; x=1712340372; darn=lists.linux.dev;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3BSlNZGjpe56WqazE4wFdBARmf3FVEmHM7BHsgVa9M=;
        b=LvhIcEihDb8dbBl5aGX3MwaNIwMgVNPPAtb+4RwdHzvOOAG9EgfaLwKnkoC+iU6FZC
         5LRcYWJ1Yz22o1ZjlysF7xWjE7FxPi8SJl/GoI0uN3ps4B+uCcUJGPmNgf0+/6wZBBnG
         BTxG5t2WgIUFr66uXtKRl2a1aMcc92Q7JjJ0PUuUSMjHdlxzMk6+tFNtxoAMbud0z4HX
         mE/8fWuzvxDnOiQEYZFoqHZyrQcS3AzrksTDWP/N6y0ZiOUMg0MdvZWRAp+FPKJw/Lfv
         MlugASjmTT4bVf5rREua6+/JbkKekiT13yR0VPUOeE8LUfB7YXXmnKWVAJy2hzZp1PJM
         XI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711735572; x=1712340372;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3BSlNZGjpe56WqazE4wFdBARmf3FVEmHM7BHsgVa9M=;
        b=N8oNg76disTSLYL9ehE1kfTkS3uridboVXqw4LJWOFHIa8Zmok/qpBL4cnaiRVihnu
         lwUfmu7vtckyw16a7//agwZaLX3w3E9/lssy6M3JoJinY0bcFvfhBuaP1xxNKUQ3KOZr
         fGTVaf1yI2YYNZyvH/PlwP5gxv/sINDAHY5qkVcdZvyV2QILm3koLuYEf4WoFxDXyuHa
         BtM291nI04Jjre4MIN+8hgoh22D616HoeTAy1RZDGv06ITcmTaRV5TzuCsMtRoLHHljk
         GN5P6KpYc6AYlVTrQ9rtnI/R4Epg3+jsi48y0IgBHilg9IG6QBn84671IrK4jKfzaoS5
         EFUw==
X-Forwarded-Encrypted: i=1; AJvYcCX3ZXR2Wj4hl5FmU3ELZSfwaqElkxLoBvvoxIEkY8runDrUQwsDTcvOx1jM4CVUQvgviLc46+NNpYCjZJBrXvFdt8R+WGxXsVfQNxo=
X-Gm-Message-State: AOJu0Yyz8dN1jfu0GV3Nd+XUVqLvJUBRsUHSIxGhVyFqO6ySBc+1TxBB
	Uce90Z5w1/RFlso1pIY3h8gGZFz/vIyf/GTDAZlBDkhcY8/TO2MG
X-Google-Smtp-Source: AGHT+IGOg/geWD4v+qwNlFlaTa+hTI8kOf/RVIEj1oqLw5OnBFGg4z0B/qqLXoBgpz1gwipqIOngrw==
X-Received: by 2002:a05:6830:1d61:b0:6e6:c6ef:cb3 with SMTP id l1-20020a0568301d6100b006e6c6ef0cb3mr3019879oti.0.1711735572023;
        Fri, 29 Mar 2024 11:06:12 -0700 (PDT)
Received: from office-nix (hlfxns018gw-134-41-63-216.dhcp-dynamic.fibreop.ns.bellaliant.net. [134.41.63.216])
        by smtp.gmail.com with ESMTPSA id jt12-20020a05621427ec00b00696766401adsm1860527qvb.38.2024.03.29.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 11:06:11 -0700 (PDT)
From: David McFarland <corngood@gmail.com>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Chris Feng <chris.feng@mediatek.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>,  Alex Hung <alexhung@gmail.com>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,  LKML
 <linux-kernel@vger.kernel.org>,  linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/intel/hid: Don't wake on 5-button
 releases
In-Reply-To: <1198933e-bf89-4237-a6e8-f7daeeebf885@leemhuis.info> (Linux
	regression tracking's message of "Fri, 29 Mar 2024 14:51:47 +0100")
References: <20240318191153.6978-1-corngood@gmail.com>
	<20240318191153.6978-2-corngood@gmail.com>
	<1198933e-bf89-4237-a6e8-f7daeeebf885@leemhuis.info>
Date: Fri, 29 Mar 2024 15:06:10 -0300
Message-ID: <87bk6wlxpp.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:

> David, from here is looks like this is stalled for ten days now. Or was
> there some progress and I just missed it?

No, I've not seen any emails since your last.

> From the cover letter[1] is sounds a lot like a "Fixes: 0c4cae1bc00d31
> ("PM: hibernate: Avoid missing wakeup events during hibernation")" would
> be appropriate here.

The specific behaviour I encountered (failure to hibernate) started with
that commit, but I think it just exposed the underlying behaviour (wake
on button release), which probably dates to when the driver was
introduced.

I believe it would have been possible to reproduce the other behaviour I
mentioned (long hold of button to suspend causes the machine to wake on
release), even before 0c4cae1bc00d31.

That's why I left it off, but I'm happy to revise.
