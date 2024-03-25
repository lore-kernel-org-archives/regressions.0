Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89AA156976
	for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711364322; cv=none; b=FEGQZ11ZeZ8gIpQhXbKi025XPTJYfe1hqLF4dcntW3VqzpDjYjwGGDx9Ifr7cPFF5Lql5i+6d3Protl5SJtYwFD9rGi+VW3wwgfV1OU3bmJEcMGaMRUlnbNWAJYg3qaZUwtnku+E+gkkSgoTR/ATVQI2cKkzcdAn8weFrGCytlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711364322; c=relaxed/simple;
	bh=KOl3fjKmkNBn73D7bHh47Hngc4sPCCxK4raJUwi0xSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnIvMXP2aSspG4zLfCN17WSrZ5uj4QnavsI+7dcE/qVK4xaQBBkMotOJlXYDOCgR0jMLiEVgTocmZcNkPYMBNe9fd59vD35mRiyucMUteCcBsvv23U1dDBrJdW/T/MuG9QYRF5MX8uSz+tuVE2u5YAhWCPfy2/ct71K8FynII/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1u8rpoK; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1u8rpoK"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so4458192a12.0
        for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711364319; x=1711969119; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFyAUkPSCFS9rx+BPpS2MocSw/duTbvD8tK+fGjRRKA=;
        b=I1u8rpoKotkqT7vV374p54wvy7jxdWtJTyPGHVNNTnNFFPnb1iDryk+2KCWDWxix0f
         nHFzJWcv8G8wrkKvoltOqXcUZcOv449NtyzMjdb56AiD85lL7vI330d3TxPNySDgz/nn
         JPbQkE5NleGaNyqpU0Yd+hSMvs6uYAWLyHIeAofwQsL24F/XaC6sp8sQa1DdcoYLwIZD
         WuTOYX954b/kLlcPMHqdL34VIz3Mxca7i2SNYtjodigvJIFUiNzLc0y6QzlCTZCh78vZ
         wvTqqj8yyqi6nasEeXctk/9/h14hfsV1ifp8OVftMQwqVDhV7NSN+4jMDwOBKqTzksIH
         nYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364319; x=1711969119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFyAUkPSCFS9rx+BPpS2MocSw/duTbvD8tK+fGjRRKA=;
        b=rDLDYLngsqVjh82cMwafMx2y4295eWaNTYqguilQqXus92rbz60RtPidtlPbNpcnsr
         nNaUVgswX9y9rjt3J9fAHWXQ2IMnjvxVoYE1jWLfFJAbgdh3hyjKUX8+rg6eOWpbRu+p
         MfJQim4f/U0v+fULC3os8v3EPn9YdlC0Y6bgyk4TgdTdZJpN9jc6i1HB3/CRoygGDFGo
         YDh8ekoXxxOn5jeY9PNp9UNFpgvaILJRp9FVZVSbH0F4L9/FXrW9X4aVIKzT5BBOZaWf
         udveIuXBm+TRB+ckoBeTBo2ZlpNY70B3wLl78re7O93pH5t4HGYu3qTt6iFuoUpyFEJ2
         +irw==
X-Forwarded-Encrypted: i=1; AJvYcCUdTpTBFE0rw7QYDJBJs48uu5ufyRB77j6NLqGaVUjGpKsbWdbZ0PD29YhFz1FBLQw21gGh+hYoNcUJd56LqspqxV//9PW7lt+lqb0=
X-Gm-Message-State: AOJu0YwDAYg9sA3Jsr7zAh9lOzRb7QeEr6FmFoL7lzVFq+MGREhNWFC9
	GHG+wR1yKuLx9AT0zTx1OFpdIqTBnJxFayjVWlNVZopusHO1ubX5
X-Google-Smtp-Source: AGHT+IHaYK99BIa4wj7eYaaTUgTDCna6WcFoy3laXXi8gDSJTAh3vFVwhkcfuR8wbtoJ0Qmaqk+T8w==
X-Received: by 2002:a17:906:90b:b0:a47:3573:b7a3 with SMTP id i11-20020a170906090b00b00a473573b7a3mr4951792ejd.11.1711364318809;
        Mon, 25 Mar 2024 03:58:38 -0700 (PDT)
Received: from gmail.com (1F2EF63C.nat.pool.telekom.hu. [31.46.246.60])
        by smtp.gmail.com with ESMTPSA id ao20-20020a170907359400b00a4a393518b6sm709103ejc.158.2024.03.25.03.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:58:38 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Mon, 25 Mar 2024 11:58:35 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Russ Anderson <rja@hpe.com>
Cc: Steve Wahl <steve.wahl@hpe.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
	Dimitri Sivanich <sivanich@hpe.com>
Subject: Re: [PATCH] x86/mm/ident_map: Use full gbpages in identity maps
 except on UV platform.
Message-ID: <ZgFY24QT7470ZGnV@gmail.com>
References: <20240322162135.3984233-1-steve.wahl@hpe.com>
 <ZgABC1oQ9YJW6Bw3@gmail.com>
 <20240325020334.GA10309@hpe.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325020334.GA10309@hpe.com>


* Russ Anderson <rja@hpe.com> wrote:

> On Sun, Mar 24, 2024 at 11:31:39AM +0100, Ingo Molnar wrote:
> > 
> > * Steve Wahl <steve.wahl@hpe.com> wrote:
> > 
> > > Some systems have ACPI tables that don't include everything that needs
> > > to be mapped for a successful kexec.  These systems rely on identity
> > > maps that include the full gigabyte surrounding any smaller region
> > > requested for kexec success.  Without this, they fail to kexec and end
> > > up doing a full firmware reboot.
> > > 
> > > So, reduce the use of GB pages only on systems where this is known to
> > > be necessary (specifically, UV systems).
> > > 
> > > Signed-off-by: Steve Wahl <steve.wahl@hpe.com>
> > > Fixes: d794734c9bbf ("x86/mm/ident_map: Use gbpages only where full GB page should be mapped.")
> > > Reported-by: Pavin Joseph <me@pavinjoseph.com>
> > 
> > Sigh, why was d794734c9bbf marked for a -stable backport? The commit 
> > never explains ...
> 
> I will try to explain, since Steve is offline.  That commit fixes a
> legitimate bug where more address range is mapped (1G) than the
> requested address range.

If a change regresses on certain machines then it's not a bug fix anymore, 
it's a regression. End of story.

>  The fix avoids the issue of cpu speculativly
> loading beyond the requested range, which inludes specutalive loads
> from reserved memory.  That is why it was marked for -stable.

And this regression is why more complicated fixes in this area should not 
be forwarded to -stable before it's been merged upstream and exposed a bit 
more. Please keep that in mind for future iterations.

> > If it's broken, it should be reverted - instead of trying to partially 
> > revert and then maybe break some other systems.
> 
> Three people reported that mapping only the correct address range
> caused problems on their platforms.  https://lore.kernel.org/all/3a1b9909-45ac-4f97-ad68-d16ef1ce99db@pavinjoseph.com/
> Steve and several people helped debug the issue.  The commit itself
> looks correct but the correct behavior causes some side effect on
> a few platforms.

That's all fine and the effort is much appreciated - but we should not try 
to whitewash a regression: if there's a couple of reports in such a short 
time already, then the regression is significant.

Anyway, I've reverted this in tip:x86/urgent:

  c567f2948f57 Revert "x86/mm/ident_map: Use gbpages only where full GB page should be mapped."

we can iterate from there again. Please post future patches against that 
tree.

Note that this is just the regular development process: regressions happen, 
and this is how we handle them a lot of the time in this area - we back out 
the breakage, then try again.

> Some memory ends up not being mapped, but it is not clear if it is due to 
> some other bug, such as bios not accurately providing the right memory 
> map or some other kernel code path did not map what it should.  The 1G 
> mapping covers up that type issue.
> 
> Steve's second patch was to not break those platforms while leaving the 
> fix on the platform detected the original mapping problem (UV platform).
> 
> > When there's boot breakage with new patches, we back out the bad patch 
> > and re-try in 99.9% of the cases.
> 
> Steve can certainly merge his two patches and resubmit, to replace the 
> reverted original patch.  He should be on in the morning to speak for 
> himself.

Thank you!

	Ingo
