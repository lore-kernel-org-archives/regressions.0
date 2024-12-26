Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C2211C
	for <regressions@lists.linux.dev>; Thu, 26 Dec 2024 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176453; cv=none; b=q+vutzAMlT2mJblXkvwdVN0eXK//H7DWYZhrK/h1U9Rz2O4mTtl/ravs4PoyU3dw942IPy3j9XbnY8d7kYLoeoa35T1CX5LDcdR7lvK2zld9EJG3yj8SyOzbK7CWMYurjVnUZ0zApqgoXtseYU+b1j5vk+tgMhGqIKhAkyK6reg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176453; c=relaxed/simple;
	bh=n2c/pdJWTKjoyAi5f1u+wUe30qTvN+tUqOS5EdVBl+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1PyigqeSRuo6NAgS8z4M0LRWU+QzV+BA47c1cYyBVeTz1PhbBZrmq1JadmfXjPVlaSRQ2+8mv09wG5VzJbH6q0Ti044rXyuXP6hLR9AyC4LOI2NnB/ibcuVA+aSkiGn3D28lCDejJszQ0W+ZrPZ488Vky1I+ePtz3crxntIk+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNYmlRFz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNYmlRFz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385df53e559so4873569f8f.3
        for <regressions@lists.linux.dev>; Wed, 25 Dec 2024 17:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735176449; x=1735781249; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w+1gJ6KVd4d91QuBEx/cbFE3H0/ijnRtOxNNQIBNOxI=;
        b=JNYmlRFzzkT+XL9UFTq00RVjwEdrXDkVg0f2rIUtN5try4MEejcntELv/Ja/gqXkMz
         avmL4iDqEymH5z8A+7qb5xkJMupXuvf1BM7vKUqBOxMGcTnMXAQDCHSXM/EnmcWmgVLh
         BSVP7LY5RMbjnZtW5B9+yYa7uIVv1LbsHiScKJ7WeYPJ3riao7WcMCAZrOL1tNX+e1j/
         Hi7jPKCiq+CjLHCUR+MGfdAextRDH05PMFIB1lgHEf0W228LM6Hbkh3VvUhmMNFS25f+
         sjiTNoh3HODeCzpkTqSpGxjFTzRjdXaxWLMfLJwvidgFrF7mLfWusZi88n7XqZFDO4ci
         Naqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735176449; x=1735781249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+1gJ6KVd4d91QuBEx/cbFE3H0/ijnRtOxNNQIBNOxI=;
        b=M4CN/AkqkTAxFiISUnyXbkmfye7SW3UX4tDAtqPUN2j1Y72RWdnhwf+m/kOdR0+a4W
         KI71eL8L0EvwXiM1r6+nX+CgaKw9dl1xWA2TFdGuwvgFjJqp8M3wOQTLIiIjd23HurG4
         HQ2rf1tWYgVnIX0LEXm4uAPe3T4Cn03qA1zirok1PZSriZUU6SGWEFPHNNr+nBoK0dhv
         kZ9qG9pRJJ9m4OJ/cJArUYkzSscDjBoNuxOe3qyDrbGXiKShRS80gn4/QmpuweUfj23z
         YkkBYo2xIXCfifxW/48Jn/H/VuOkFbMpnWaJBmvKjj9n1sj9sZ1rSisawD2bg2u9OTvR
         I7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUMy7Xom5/ql983Y+S0UOY9/SlVMBNNdux7MbWMfZUwPeo9U5rb51+kxyPCUZk2o/jBKtJhb9v6eioHWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAtN8+Tl3XBT4sViGTr8RBKhwIAzldLFNG1YX1RIHSmwTF8ECO
	cMjoJrGzL9nA4kF2GBcWsduyRVU5IiVFGbYJPx/yoV7mUWBLwRFp
X-Gm-Gg: ASbGncvAeQRWJtARA+F3vsdcLAD4AfHmldF7boKyL4knxuJXxeFGF/08SC11yzZFvnJ
	3q2gqlupKOqsmgMiwKOTG1Z+4MYTnq3hUE/pooPT66p1Eh4hugYk/UTU/TzzXKd/BmfzcdCIu6z
	Up2sfqOGV6sRiaRfwlr6T5r/BHzLZQMCmHA2yKnGvj0v9cVgx8WPDSLyG4111GBCFzM87j6hMl0
	x4CEwGjGIf8aKPfeGc5og0kRuLDt2ykNiWqy04gkqOIkcmo9R0E5juU/5M4LOE=
X-Google-Smtp-Source: AGHT+IEhKxgf4hIQTI+Klr0apBS3ueanh/tTSMf0cm7MR8jqtmgAC2JCW+Dv1tvv1AYLHnhwnZnAgg==
X-Received: by 2002:a5d:47c3:0:b0:385:e35e:9da8 with SMTP id ffacd0b85a97d-38a221f69e0mr18547954f8f.18.1735176449451;
        Wed, 25 Dec 2024 17:27:29 -0800 (PST)
Received: from debian.local ([31.94.62.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219611sm218332885e9.23.2024.12.25.17.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 17:27:29 -0800 (PST)
Date: Thu, 26 Dec 2024 01:27:25 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	amd-gfx@lists.freedesktop.org, alex.hung@amd.com,
	regressions@lists.linux.dev, rafael@kernel.org, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amd: Fix random crashes due to bad kfree
Message-ID: <Z2yw_eJwR5ih1Npr@debian.local>
References: <Z2yQvTyg_MWwrlj3@debian.local>
 <b98f2fa5-fbe8-4958-bf20-fa5d28c5a38b@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b98f2fa5-fbe8-4958-bf20-fa5d28c5a38b@math.uni-bielefeld.de>

On Thu, Dec 26, 2024 at 12:19:02AM +0100, Tobias Jakobi wrote:
> Hi Chris!
> 
> On 12/26/24 00:09, Chris Bainbridge wrote:
> 
> > Commit c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if
> > available for eDP") added function dm_helpers_probe_acpi_edid, which
> > fetches the EDID from the BIOS by calling acpi_video_get_edid.
> > acpi_video_get_edid returns a pointer to the EDID, but this pointer does
> > not originate from kmalloc - it is actually the internal "pointer" field
> > from an acpi_buffer struct (which did come from kmalloc).
> > dm_helpers_probe_acpi_edid then attempts to kfree the EDID pointer,
> > resulting in memory corruption which leads to random, intermittent
> > crashes (e.g. 4% of boots will fail with some Oops).
> > 
> > Fix this by allocating a new array (which can be safely freed) for the
> > EDID data in acpi_video_get_edid, and correctly freeing the acpi_buffer.
> 
> Hmm, maybe I'm missing something here. But shouldn't it suffice to just
> remove the kfree call in dm_helpers_probe_acpi_edid()?

Yes, that would work to fix the bad kfree, but there would be a small
memory leak of the acpi_buffer struct. It's not a huge problem since
this code is rarely run, and the Nouveau code has never tried to free
the edid buffer and apparently nobody noticed, but it would be better to
do the correct thing.

One other curiosity is this comment in the code that allocates the
memory:

case ACPI_ALLOCATE_BUFFER:
	/*
	 * Allocate a new buffer. We directectly call acpi_os_allocate here to
	 * purposefully bypass the (optionally enabled) internal allocation
	 * tracking mechanism since we only want to track internal
	 * allocations. Note: The caller should use acpi_os_free to free this
	 * buffer created via ACPI_ALLOCATE_BUFFER.
	 */

Which makes me wonder if all the calls to kfree on acpi_buffer structs
with ACPI_ALLOCATE_BUFFER in acpi_video.c should actually be calls to
acpi_os_free instead? I used kfree just for consistency with the
existing code.
