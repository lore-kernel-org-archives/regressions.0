Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2875A4D0
	for <regressions@lists.linux.dev>; Thu,  1 Feb 2024 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706808012; cv=none; b=Q76AEaGNGUKl/zysfOAzC0Rb022oLj0CNJ9Nl9lMv/cOR0/cbqaRr7rBgoQcG9fREu46RGFruLycqglSsje77vIZMhoGmQcrHq/3wnEINzJ9wTiWLtys248EU+aFGdTim77fZ1F7JlCimXKYbsMQY/afqnp8gtuhkqqLfLd2Tl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706808012; c=relaxed/simple;
	bh=F3DSbsqvGhZ8uJVJ9kJ7JaXM9a9iPTGxNHqhxjHlozA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqgFZfbJt77ygEOuviaqLiUDKVew0vT8u5qzE8ampsB9/pbfHzO8XQA15Z5rPh9pBpIb33d1Q6qDfSQ4xjoXd4lgvtgmiPhDbdnCe54uEZrApJFQWQkY1C6gOX0GvvdbQKMmxiAnclSQh7Vztb+g+1Eiw0U9W2/G6LUdLClihp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=j6r9oTUb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="j6r9oTUb"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a359e6fde44so125580366b.3
        for <regressions@lists.linux.dev>; Thu, 01 Feb 2024 09:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1706808008; x=1707412808; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F3DSbsqvGhZ8uJVJ9kJ7JaXM9a9iPTGxNHqhxjHlozA=;
        b=j6r9oTUbNKv25lEAbw86LwfV+0Q1J/ZSvGJxUV1HwomrpM0zSmCinF0kzWzPY6mkI7
         DcTaM8kRCCWK5SzGn1XbhpdWZ5HuQL0BGj7ogj03QN5Y4ven3ZONy8AjT/eIaXPaVQfV
         TdQheNDpv7AIwxVUUSb621c0NhZiFlm2Pq71M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706808008; x=1707412808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3DSbsqvGhZ8uJVJ9kJ7JaXM9a9iPTGxNHqhxjHlozA=;
        b=Fi1sJeeleY9GQaOvkDrqNclekcDClbbPAT8ZqTw4a8y2kv9RJEkN3UHRK83USNwBE0
         UTWspBcIdcgWEm7na8b1O9a6jKbGXYNT8ZUIGtqkf0gbUxhy/4wMS0sjQky0e0EyNPUU
         V2MgliSvy8dvVzbWigEz7ocG+pm8Zx/Y8CTEJ9iT/FCcY1oy6EJkm1qGOzAnTqKWzT0O
         KT/JUGkR9bVq0KqpKILOVoHAKaDltY8oLU12uuuQfKmxqTn5yzzLepP28RjiUBOZy0Hm
         mvQ6hWT1SfKkn0C89xIoyLVLecpOuu3RmQIUH//c3w3mtbSwuyLhfz77E4FGkZZGQqH/
         p4Vw==
X-Gm-Message-State: AOJu0YzDGkroMnSYb/LZeO89Rp57orVAxGcFW3rtGuzrGJzHrxC8p8Gf
	4aSIAGGjDW1LvDZ9laJLLlvoUz72rUvtMDiy6i7GZoKv2XnuzCWrzQ+von0AZhOYBBqTwNy1PFG
	ecShF1xCH154yDpoe7ni1YqisxKGZFk/A4rqO
X-Google-Smtp-Source: AGHT+IGIeWFfhZFVVG+UgrMF1VFPDhYtZlWHoSizHzHlgIACbwdWYsfWMKIqthzQGzROtKWsQkYAT1MyUWRT0QpGCJ8=
X-Received: by 2002:a17:906:5290:b0:a23:6dd6:7eed with SMTP id
 c16-20020a170906529000b00a236dd67eedmr3679974ejm.77.1706808008410; Thu, 01
 Feb 2024 09:20:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK8fFZ7Xi3=1HFY400firmpRWzHDPsi90cUU5bjOkF00KNZWeA@mail.gmail.com>
 <bce78734-d359-499b-9693-05549e6a73a4@intel.com> <CAK8fFZ6PqCwgt1n4iuROs=76esQVSOS-HHL=0eN7+efeKT25Uw@mail.gmail.com>
 <898b6ac8-186d-4675-a1e7-abd78b885d01@leemhuis.info> <20240201065726.50a0b1f2@kernel.org>
In-Reply-To: <20240201065726.50a0b1f2@kernel.org>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Thu, 1 Feb 2024 18:19:42 +0100
Message-ID: <CAK8fFZ6jige-zA5YPMKVf3bB2gCL8WDrY-SCs5EWeJBn5A7YQg@mail.gmail.com>
Subject: Re: [Intel-wired-lan] [REGRESSION] Intel ICE Ethernet driver in linux
 >= 6.6.9 triggers extra memory consumption and cause continous kswapd* usage
 and continuous swapping
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, Dave Ertman <david.m.ertman@intel.com>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Igor Raits <igor@gooddata.com>, Daniel Secik <daniel.secik@gooddata.com>, 
	intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"

>
> On Wed, 24 Jan 2024 15:29:38 +0100 Linux regression tracking (Thorsten
> Leemhuis) wrote:
> > >> I think that's a bad bisect. There is no reason I could understand for
> > >> that change to cause a continuous or large leak, it really doesn't make
> > >> any sense. Reverting it consistently helps? You're not just rewinding
> > >> the tree back to that point, right? just running 6.6.9 without that
> > >> patch? (sorry for being pedantic, just trying to be certain)
> > >
> > > Reverting just the single bisected commit continuously helps for >=
> > > 6.6.9 and as well for current 6.7.
> > > We cannot use any new linux kernel without reverting it due to this
> > > extra memory utilization.
> >
> > Quick query: what's the status wrt to this regression? Looks like
> > nothing happened in the past week.
>
> Is someone working on this? Indeed the commit in question looks
> harmless but can't argue with the revert helping :S

No clue if someone is working on it, however the commit itself is a
trigger of some other issue.

The analysis of my colleague Igor (see previous email) shows the
memory consumption is caused by queues of each ice network interface
(even the unused ones). Our final fix was to lower the queues to 6 for
used interfaces and 2 of unused interfaces manually.
