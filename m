Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5D23D2A1
	for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744295; cv=none; b=Qef0J45baKtMorZkMHdij5i/Ir6Fwz3t8WK6aANr8RTmOmedqbrabsuFRsf8oSh4IV3yinDU3x9+eVgKrYNJxB1LcoufNfUQCAmAA6rdMLPAu1FW/mUegz44oifhoCzfeB9u8rg9y/5BIMu9M7uAoVC8oAPLBPfKQ8xObkjFpjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744295; c=relaxed/simple;
	bh=n0o8aS3XH/mRkJO3jAxK7O0yOFg1iwJA/hvjR6P6bw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4VhVIuUrtL/fwjjRqWHH6wUo+mY1tpKej74if9ATuNv8OyDYTVaoSJ9bnNWRP82y/Jp4WUh2Jc4b0/ierjkx6k/GVQdsXSpp1Y3R2Sj1/Uqi8UeVLUPObVNDmRmsNXkMR2lsZUDZPXPKsWVa3a4X/k/mE6lvu2QMFO2uqW4yTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fl5r0vOm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fl5r0vOm"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acacb8743a7so895528466b.1
        for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 12:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744744292; x=1745349092; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zhFlUMtNiRCAq5DV9vIrNO9nfbesFvx4yBgb3QsDraI=;
        b=Fl5r0vOmizy9kChrQrY824SJjLgh27wu8InP8iEjdogxVpmH3jueXkx9VT0EZlGBVS
         +ei6+2J9mvnFNzckQPHqBJicWIDzA9OhTfOcxZRi9hiBeXN0G8YKGg52SCsDyZwBzGSU
         FI9pY4Y5gv/0UkmL8RmHWc2Xg6Bp3453tbkfR4FkpnKi83wlnaTSADG82oxHTxHy5oQb
         RQoHaxrrtoPJMg4X8YUzrcUbqD2vR0GbMEJU6WVveMVRZ2EkYgVEPLtZzBkzRnq9WAWP
         8CjCv6W97shOmr46NfKhp66R80Cu1T7vqGXeoUXiiK3BnWiIHvKXOAHsuUr7nWkuwjW1
         hnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744292; x=1745349092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhFlUMtNiRCAq5DV9vIrNO9nfbesFvx4yBgb3QsDraI=;
        b=A9hRkehQ0ynL3DlyW0pvgSI8m1ZxWS6he3stPLURdfocU1s5v+chA/7YPYbJktxG9e
         E3/KeucFkPd7StY+DlAC40uKFUcBYrqwzSd18l8IVvJrzONfkfEZW7o56z6ov3Gbqdms
         OhhbQfn/S/Vq5RUeBj8gT1Rh30aE34qWF9Mpbt8kIEHq8HH+allFmmXyngJjLY7B4jEO
         mvAqaAwcf5ejDo8mgLn30H2ZALjUJG4eW+y5juIRcPAqLLkncPztDAoT/kAnhc0ALX81
         6wAOJcwnov8gU++EwaMqrIO44kTD6ifO49rhvkOCeT5uj0mikLVQHVG31bJggeGibb/4
         1VzA==
X-Forwarded-Encrypted: i=1; AJvYcCU29Ds+q301U2bmC9gjOU7Q+gH+/pq3wqtHYyUEL0c3J7b/45ocjlyZez04yaGIwT2EnwxxdOplB5xfeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKIstSmE67eyG6q/hf9Df4x3uAPs1ekcLqdeeMODwJLdYL+/m8
	Cp2iYkx4tCbWKWSZccVXyT3YWHly9slonRMlXUl4FrhOMoFn7qRN
X-Gm-Gg: ASbGncsKvt/53JQQHarhaInlKdu+37SuOFXSrivbBrc+RfznZfCwJQsNJkQi2L8e+b6
	Mfinbms15xW5+Go8A3U4hEND9Mwy4ui60YKS/I5AQFCejL2H05SRKGKFMt+qZsAFPFnXOicI3qb
	xGBX+Q1MGLSdAwoG28+dlcgWQEELqgDjnkjEwTEUstM3Fg6DCoTTF3xDiqbv06UH+56lkIpVUoX
	v5DpU9wOZpsHGBU2PNMu+l43T/49GLf4bVqgDu4TNa2wFMzUi+4ii72MyRLmkBdGsgUiFM7b7ys
	F2OjJblJ+v5fy22Sm/iMyZSabOV0Fh6NKq1Ceqmo2qTOgGI6hmIACIEdZo18XMvXsA==
X-Google-Smtp-Source: AGHT+IGEFSrt2ZpOon+C2jav9XU7evOc0hH3tvZ42nnDp049L00AJY/eMoY7ecXbtHbFbFdCi8bRGg==
X-Received: by 2002:a17:907:7211:b0:aca:d276:fa5 with SMTP id a640c23a62f3a-acb3558fc6bmr63346966b.0.1744744292063;
        Tue, 15 Apr 2025 12:11:32 -0700 (PDT)
Received: from [192.168.2.22] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc2b7sm1132351666b.155.2025.04.15.12.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 12:11:31 -0700 (PDT)
Message-ID: <b872cb3a-f91d-4169-a244-fbefbca5680a@gmail.com>
Date: Tue, 15 Apr 2025 21:11:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression 6.1.y] Regression from 476c1dfefab8 ("mm: Don't pin
 ZERO_PAGE in pin_user_pages()") with pci-passthrough for both KVM VMs and
 booting in xen DomU
To: Salvatore Bonaccorso <carnil@debian.org>,
 David Howells <dhowells@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Al Viro <viro@zeniv.linux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Logan Gunthorpe <logang@deltatee.com>,
 Hillf Danton <hdanton@sina.com>, Christian Brauner <brauner@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 regressions@lists.linux.dev, table@vger.kernel.org, Bernd Rinn <bb@rinn.ch>,
 =?UTF-8?B?S2FycmkgSMOkbcOkbMOkaW5lbg==?= <kh.bugreport@outlook.com>,
 Cameron Davidson <bugs@davidsoncj.id.au>, Markus <markus@fritz.box>
References: <Z_6sh7Byddqdk1Z-@eldamar.lan>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <Z_6sh7Byddqdk1Z-@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 8:59 PM, Salvatore Bonaccorso wrote:
> Milan verified that the issue persists in 6.1.134 so far and the patch
> itself cannot be just reverted.

Just an update:

With 6.1.134 stable as a base, I reverted that commit (upstream c8070b78751955e59b42457b974bea4a4fe00187)
+ applied upstream commit 873aefb376bbc0ed1dd2381ea1d6ec88106fdbd4 (vfio/type1: Unpin zero pages)
+ reverted upstream bddf10d26e6e5114e7415a0e442ec6f51a559468 (uprobes: Reject the shared zeropage in uprobe_write_opcode())
to be able compile code without errors.

With these changes, kernel works with my NVMe passthrough test again. This confirms the issue.

Milan

> 
> The failures all have a similar pattern, when pci-passthrough is used
> for a pci devide, for instance under qemu the bootup will fail with:
> 
> qemu-system-x86_64: -device {"driver":"vfio-pci","host":"0000:03:00.0","id":"hostdev0","bus":"pci.3","addr":"0x0"}: VFIO_MAP_DMA failed: Cannot allocate memory
> qemu-system-x86_64: -device {"driver":"vfio-pci","host":"0000:03:00.0","id":"hostdev0","bus":"pci.3","addr":"0x0"}: vfio 0000:03:00.0: failed to setup container
> 
> (in the case as reported by Milan).
> 
> Any ideas here?
> 
> Regards,
> Salvatore

