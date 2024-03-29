Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C6F9E4
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711696524; cv=none; b=LQW1HnWpolnfmGAESqx1PWR8TZc8Scd0DYcyoWheN09hLb6450CDy4dXwWd7ecmtouRSRcSgbHXNeNphuHlndlpsor7q2P1Ksbclh/vPAn+V7jFhqdiKo/f0/fzxOv9w7gQmW1r9kAVGA3NqSgCA1iQh5Shr57RW6HM+FRz2isk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711696524; c=relaxed/simple;
	bh=vcBZF75PvdSN87wejsi7pX6QTEy6uXjLbXwwfZFg3Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3Hjt6z+YPScPnfhV9akejUaJq1WnXQX1xLSINAn+e4DDyyX4hec32nIjZjhUytJnpJjOCz3Cr80JTT1maILdWY7CuO0fyiICpOYIbXeMGTkK1rO5as034ZzYHPx9QmAOiTybg+m2MzjSbvNZhCyQwxN8b/mBCJ8h/uX7I3nuAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPn5NEaA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPn5NEaA"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56c36f8f932so4835779a12.0
        for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 00:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711696521; x=1712301321; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mozfWZbRnnqWKHe9tnc7q0wOVsOmikcudgvgpeew1+E=;
        b=TPn5NEaAmX4PZaqG0YZmAAVqUr1StUp5znKlC/+zCMGKeroP1EkcL5TjvMkKLc2hSG
         ZKc6QztW4hAXorfvaAxgJ8IG6c3DzF4pyWPytGzjt8FqkFjt+jFXJZIde6La0rRF34MN
         XLwDrDx1Tf3qyBa8kSykZDVFA1taVgAAIR9Eqb9GVqjKcW2XU2SFAQZv8WCSh3rDE0r5
         pn5M9eWiuxFPZR3ZYjmQsakHsTdzGTX3QUIpTuxGjb9Dznm2VL3U4GP3XkV7rEERkNER
         rHwzS7Ye1XCznwqP93qOdQ5ZW7Uj+S+wYAqYrmFX9wfbe0ueG1583WymYNyor6VDffjR
         Hk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711696521; x=1712301321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mozfWZbRnnqWKHe9tnc7q0wOVsOmikcudgvgpeew1+E=;
        b=DCQkl2oFsG9PB36XwGPG8AVIfVcew9rTkHdGhwFzj8x0THQ0mnMVaglolDkuuVx8cB
         LShtTy+v1Ba2pAadShWBf1BnWDexT6pNkGql9uyWWjV4E/HjWDY50NNBFmaJMcycfFvc
         XqI2apzfIG9pFzB16GQzK8yEWc7VEjZCifkIt4vra8MeCDpLW2gr2sc0R3O3W4enL44u
         OtBTGe1P+XW1CL3YRufmULtpaMEbl6zOSVfTQci8m+krUQjQD5MMBJtlDehA6U1POA1w
         9KurIOCQcz4uF51ogBDcXy01E2zMZ/+0BbrP6K/XFJsaOkAOMlozF+r6PxOLYOuoBpUB
         EM+g==
X-Forwarded-Encrypted: i=1; AJvYcCV4+Jj5EYxd0mBZhl1fzL4bITkaRBk2YVou3YAHC+Gf19RSieihFxm9f054jaUm86a7zfOZA46Ur74pvJ+b2bRfOsTvHgqFdbAwe2c=
X-Gm-Message-State: AOJu0YzMuUz0LEA2MSNz5Myqb0tob8Lbu1GPYwU9DJ/cf4TRN9au896S
	JMBC3F1KwdK/zmg0nb4WKzCH/77B79lJXeMctS1V2idIzIu1Dp9+
X-Google-Smtp-Source: AGHT+IFhRkjxogRTyF/K3aWBTa/zm6XcSZhhLZnndCssQDKYDtq+qxbh6p75jpjUxX89xLoNA/e6vw==
X-Received: by 2002:a50:8e1b:0:b0:568:b0f4:fe69 with SMTP id 27-20020a508e1b000000b00568b0f4fe69mr4049605edw.12.1711696520810;
        Fri, 29 Mar 2024 00:15:20 -0700 (PDT)
Received: from gmail.com (195-38-112-2.pool.digikabel.hu. [195.38.112.2])
        by smtp.gmail.com with ESMTPSA id ew12-20020a056402538c00b0056a033fa007sm1675741edb.64.2024.03.29.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:15:20 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Fri, 29 Mar 2024 08:15:17 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Pavin Joseph <me@pavinjoseph.com>, stable@vger.kernel.org,
	Eric Hagberg <ehagberg@gmail.com>,
	Simon Horman <horms@verge.net.au>,
	Eric Biederman <ebiederm@xmission.com>,
	Dave Young <dyoung@redhat.com>, Sarah Brofeldt <srhb@dbc.dk>,
	Russ Anderson <rja@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Yuntao Wang <ytcoode@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4] x86/mm/ident_map: On UV systems, use gbpages only
 where full GB page should be mapped.
Message-ID: <ZgZqhWoRZoq5tJoU@gmail.com>
References: <20240328160614.1838496-1-steve.wahl@hpe.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328160614.1838496-1-steve.wahl@hpe.com>


* Steve Wahl <steve.wahl@hpe.com> wrote:

> When ident_pud_init() uses only gbpages to create identity maps, large
> ranges of addresses not actually requested can be included in the
> resulting table; a 4K request will map a full GB.  On UV systems, this
> ends up including regions that will cause hardware to halt the system
> if accessed (these are marked "reserved" by BIOS).  Even processor
> speculation into these regions is enough to trigger the system halt.
> And MTRRs cannot be used to restrict this speculation, there are not
> enough MTRRs to cover all the reserved regions.

Nor should MTRRs be (ab-)used for this really.

> The fix for that would be to only use gbpages when map creation 
> requests include the full GB page of space, and falling back to using 
> smaller 2M pages when only portions of a GB page are included in the 
> request.
> 
> But on some other systems, possibly due to buggy bios, that solution 
> leaves some areas out of the identity map that are needed for kexec 
> to succeed.  It is believed that these areas are not marked properly 
> for map_acpi_tables() in arch/x86/kernel/machine_kexec_64.c to catch 
> and map them.  The nogbpages kernel command line option also causes 
> these systems to fail even without these changes.

Does the 'nogbpages' kernel command line option fail on these systems 
even outside of kexec (ie. regular boot), or only in combination with 
kexec?

Thanks,

	Ingo
