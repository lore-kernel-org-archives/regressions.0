Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244CC3E49D2
	for <regressions@lists.linux.dev>; Fri,  2 Oct 2026 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954458; cv=pass; b=ucEZkxORbHipyYtiFgVlish/gRtk4kEDHlm497UrCOlF3JyPPiAeww6Jdjces6/l+E4MPTyC3VaoimiocqyxGvwmHWzoJx+owDlnhPZU/UKmJOQvDErkjSv8Y6CssrZ57RJZZ/rKUnU9zFzvBQ0Yibt/gUS6QmDlbjjamc/y+8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954458; c=relaxed/simple;
	bh=c8Ui2uQdljkfizQJxJXTO3Y+BpS1mteN/FKkUOLbueo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDRgZYBgm4k9HdrevYIQR+8tgMSePV46NLPNp7PhVg1VHymIdOe+/qT1HejjCtXR4xaTqSl+KnQtODwnossK5gbvGs6WzkemE4VEPlLK7SbgC441NqMpFOkLXOdMlwpD0bUYEZtx3OCApCBNde2KzoV5T749i5sZ8vYexw7mKIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omzmnGd8; arc=pass smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omzmnGd8"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d77aa5735aso11966eaf.1
        for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 08:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790954454; cv=none;
        d=google.com; s=arc-20260327;
        b=Oxje33WBwerqtrAsM7gyKz/OjuVuXggtHlzlKtrrEmxPsmT2f/Syniv2V2b6ZoRegY
         e+rxpAtqvy6C9dolAn/E6AhcN1oWZPLaqFDVj35CNE/FhutQBAmdht1f24vScUHkYTk6
         7c3XtvcQ47dxvhlm9g4cdff8FS8RKlr4n+qQaEH7fad3C1kcPqsPeG9nngESDCVA8bpO
         ZUU+A4LYcfRB0Nbw7YiQii8q2KgD4QlmM7kZF/mQZfj71c/sk+jMmn/e6BJFdzC00auy
         B9ZSKlWDSsJLVBnUWWnWu1QIs31mrjM66UgxKDkXu0OcumnZ3rmgq+D3Se4vG5ubbp5o
         kCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pRJcBvkIQpM6vnmBseq7C5SjURfqx9cLuKNSFbQ72co=;
        fh=XCUnfO2R+n3kUkxHvG2mqk3heFoVhe7cy0RQMS+8YRo=;
        b=kviX+Q3nIK11AgcqBcXpFoJmzfwdi3d1yMgnK6dEtWWO0PGcGBU7XdgoiK1qMF9LQ1
         Nw3cuz6f9EBXKSudU1picwRMPOvhrtySBiaGV4lT46mUCAs3oOYlCpLSEDZQu1fAAu9v
         Ldk5NRDbwZ+Lyckgi5PQ07mngOIB1O59De4AEvJsmiXDAIdogu3QFqftIdr9HhG6xbFl
         8LtGJvXrZWOrO8QVK+Te7oprLu/jo2d3Y++guFpU01HxbM/eCYchrWDmnkqB4tEkto4g
         swxjfUst0ncQnp5pkUomk4MjOBhj3DW/7/is4gvTikr/hV0vNi4Eiqqq56A6M3gxAK0m
         5g+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790954454; x=1791559254; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRJcBvkIQpM6vnmBseq7C5SjURfqx9cLuKNSFbQ72co=;
        b=omzmnGd8gcJqLcSKqFeVbt20NjHhoB+Da5avUqLbLGhBTm+WGkShzReVyT9wbos/pZ
         mjAKQnRVn1bF5qHYE3RMAm1mR9zyvDKaN5xngEwj5fA6JbQLuYa9zFPykq4x1Jc0+De1
         AUJ5hs9Ky8IyxaPoCN4LT4vKx8x+35aAgTCjAa7X9PtkCKepXqRIPo6SHvq0MljsvyDL
         PomgEY0ge+zf4Qt7Tg+9gnEWq5NvQijItarM7uaZxm6GLg9XdCr+Rh2axAe57NInAVcY
         E4zdzuDRlZR2i8Yu70sL4r+/RMEkHYjkPNHbq6gr4Vbo0hYxugbb+EHBgl4mswxsSlb6
         fTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954454; x=1791559254;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pRJcBvkIQpM6vnmBseq7C5SjURfqx9cLuKNSFbQ72co=;
        b=ebnV7PGhTAni3t5xWnmcZww1ZCHU1iJZ3ASMLaY6ThN151KCstMPt5xVJxiQ6IIEeV
         jaIc7ljq5nmy5VbjmfO95aekKa8u6Cjn2V/eIT6Na61IokstF+rid/3vDF0CYgxzYKcc
         WsPJdHWkuFiQ7vN6gF0hxoNx1Mi+pWKihs+O4lWwXCAycRHfvfig3xOLRcVgoTxrw+wo
         p3sBGSFW8SiVASrCuN3v1DmE+/x99kKhMWolYYLpbebmOOsGSbjSLlkEpNRfhWPizbZY
         3v5Q5liwa9id3KZG2M9xFf1c5A36TzwdGAj5qwessNbc0QgyfVx1MwG0OZpkNbx9sxUQ
         ew4A==
X-Forwarded-Encrypted: i=1; AKwUvBzbfU7Erc/k1vCMgaMLs+dd1GASmPYpMb7Iufkw4QHhir5qVGEApJAhZaacPu+9/Bhv03J1L/1BinKOFQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kd4otkZsgbPBnxEQaLiXDBb2Q0NY8jzZ+XBcs5H+qHr5bbddPY
	MDnnoDHADcqnMPQV+ozqXxL259IFzh/prGm2p4SG3lLQzlvk2xkF+tSDEDCtLoetYTttY1wLeEN
	iswFHwohfFCcOp7fkLtQb7azSIMbuWis=
X-Gm-Gg: AYBFou1fpQ1lIBVMa60iiOuK24kMFYdjl2MJZPt4gZ214phmN+opnBDAhOk0BCVsKv5
	n+VKezIO3s9PEhKllvYqT+i34ia4BvGWoqfs9j6LM5XbFnE4QkP5C4p/a93tyiZ7Z+s/qR/QMDY
	xQpWn8dLjbt0SGCYoBmBUZ/xfByHIUmYpd8WW1M6/exKO93NTlLa+7Kb224LGwGvLts14pGVLAT
	IqFSHVKxQoPHKg4Md/SjL/N5IImLX1lx+oVGuc5CsQ7lDA54CCAlWngb3KfjgLmQ1hynhn3S55l
	s2Dkqq1lzcWLE5J9FKTXnP3Y0FhGA8OK556ceJeJWSx1horxv9dRzUNNzTLp/9cUG2/VJykSF5/
	11JPpMUj5dA==
X-Received: by 2002:a05:6820:1789:b0:6df:5b31:f4b7 with SMTP id
 006d021491bc7-6df5b3205b0mr1758431eaf.88.1790954453969; Fri, 02 Oct 2026
 08:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADrS85612m-Hh-G4BJmOhy-y6r3Ni3kD8_GM-2QRBeWWEEZWuA@mail.gmail.com>
In-Reply-To: <CADrS85612m-Hh-G4BJmOhy-y6r3Ni3kD8_GM-2QRBeWWEEZWuA@mail.gmail.com>
From: Andrej Scek <scek.andrej@gmail.com>
Date: Fri, 2 Oct 2026 17:20:43 +0200
X-Gm-Features: AclHuK8klb-fvmewqmk7PkjTDnYTa3t-BgP_FVZnqttllQOZ5PBEMOmDlR84Ucs
Message-ID: <CADrS857iYjafXEZcHRSmeOFjrzs0DYG5Dp2PeS0n669cHBjAuQ@mail.gmail.com>
Subject: Re: [REGRESSION] amd_sfh: accelerometer broken since 6.19 ("Event
 data for report 1 was too short (15 vs 14)")
To: linux-input@vger.kernel.org
Cc: Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, srinivas.pandruvada@linux.intel.com, 
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, regressions@lists.linux.dev, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"

Update: this looks like it is caused by

  0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing bogus memset()")

which was backported to the 6.18.y and 6.19.y stable trees on 2026-04-11.
6.18.16 predates that backport and works; 6.19.12 and 7.2.8 contain it and
fail. The AMD SFH sends 14-byte reports where the descriptor declares 15, and
those are now rejected instead of zero-padded. (This corrects my earlier note
that hid-core had no relevant changes; I had only checked v6.18..v6.19.)

The same symptom on another AMD SFH device (Legion Go S, "18 vs 14"):
https://github.com/ublue-os/bazzite/issues/5796

So AMD SFH (hid-amdsfh 1022:0001) probably needs to be covered by whatever
short-report quirk/fix is adopted for this.

#regzbot introduced: 0a3fe972a7cb

Thanks,
Andrej
