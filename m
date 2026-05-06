Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F543DA31;
	Wed,  6 May 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778068846; cv=none; b=evjdUfrEZJvyY5RohKMetM5XEwL1r74ez1doqov9oIknhFfwzFXVPSHPFZ96GNA9GOoXYcvw6xoHMqkvx3vGiZo0pdZn8UsHx24Xi3vy28G/2mH8RSp1w2ibQRgNqGiSCSrjEgf02SQk+zX8/W/Wzj7kH+tlT58ftLJ3H++lJNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778068846; c=relaxed/simple;
	bh=6jt9rqVjDw8+U9+bWoSE6lGs9K7U1O4LWJ1RxwZ2qBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJqbxBJQDZ3jxi3EHy0vTKCxxROoJFreYneNTDlnMpChoGImYK5PjW2baxQUDy/zlloO1g71VTmv3YLlBfnRa+WvDYHVI/cLNmCZeY4qSFZr05rdvzQafiCyxkTi4DpHnf7WcatERxKbFrnUQSumGsLn9C5onOUWMfl1JET6olY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=umrRFSUs; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="umrRFSUs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=PrD9nIfCondzVS8dnGq0XJ558JQOwkmWdaEIgtjAFEA=; b=umrRFSUsjcuCpTZdSQk2odTaq7
	zSBZZX2lQZItYCEvrISEfnyMikiZEmqhK8KL7uiNf7ZN1zCtZuFYDwkw6jGEG2tx6SOkW9Bzpuh/L
	KSFbupma37aFWDYl5j5lfqV7E9Jel0ze6pHVY7Isee27GI9JrHStaeHcZ0lGloc3lPL6nYKgkY9F0
	gHt1Ch1yZMilMSCHZCpRNZ0Bzh5R3ZzY3vHAGb2aUcSK0wyqZ4sbxwLLeHP4TjqxCc6TiCjXEpHRB
	L31vXa4eu9tgr1a0CYsHBWvu8pgu6otkRkrj1tmE9HJGk2mioynCuyvhhGtkQOndJKv4hHYLxkAP2
	ul3+z9og==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <carnil@debian.org>)
	id 1wKavZ-003ZcQ-2E;
	Wed, 06 May 2026 12:00:34 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 6F753BE2EE7; Wed, 06 May 2026 14:00:32 +0200 (CEST)
Date: Wed, 6 May 2026 14:00:32 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jiayuan Chen <jiayuan.chen@shopee.com>, 1135514@bugs.debian.org
Cc: Paolo Abeni <pabeni@redhat.com>, Sasha Levin <sashal@kernel.org>,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	podorski <podorski@gmail.com>, Brad Barnett <debian-bugs5@l8r.net>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
Subject: Re: Bug#1135514: [6.1.y regresssion] 9a95ec9144ee ("xfrm: fix
 ip_rt_bug race in icmp_route_lookup reverse path") causes log spam on ping
 to unreachable host
Message-ID: <afstYFbDuJ-zQOtw@eldamar.lan>
Mail-Followup-To: Jiayuan Chen <jiayuan.chen@shopee.com>,
	1135514@bugs.debian.org, Paolo Abeni <pabeni@redhat.com>,
	Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev,
	stable@vger.kernel.org, podorski <podorski@gmail.com>,
	Brad Barnett <debian-bugs5@l8r.net>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
References: <177771348699.1898023.16904466444228860838@eldamar.lan>
 <177768508393.32886.13183514325428485879.reportbug@pjp3.podorski.net>
 <CAL3Ev5070_=K9F9+03GrE2+4tgr=j_CO19=m4ZPTd17YSwmokQ@mail.gmail.com>
 <afsMUZa99G_gsve1@eldamar.lan>
 <177768508393.32886.13183514325428485879.reportbug@pjp3.podorski.net>
 <CAL3Ev50kzBn41s2twKjKAv=98sPHwPVCp5nmgmA8XGJA3FdVmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL3Ev50kzBn41s2twKjKAv=98sPHwPVCp5nmgmA8XGJA3FdVmg@mail.gmail.com>
X-Debian-User: carnil

Hi Jiayuan,

On Wed, May 06, 2026 at 05:47:52PM +0800, Jiayuan Chen wrote:
> On Wed, May 6, 2026 at 5:39 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
> >
> > Hi Jiayuan,
> >
> > On Wed, May 06, 2026 at 09:04:24AM +0800, Jiayuan Chen wrote:
> > > I think it because we failed to backport  this patch before:
> > > https://lore.kernel.org/stable/20250207161555-b1a8749027831a1a@stable.kernel.org/T/#m0c880c1f04f7211aea9b7f6b4de0b64aa1726417
> >
> > Which won't apply cleanly, I assume this was the reason it got not
> > backported to 6.1.y. Do you have a backport of that, or should the
> > original commit introducing the issue be reverted from 6.1.y?
> >
> > Regards,
> > Salvtore
> 
> I tried to backport this patch to stable. Hope these patches apply successfully.
> 
> https://lore.kernel.org/stable/20260506012057.285743-1-jiayuan.chen@linux.dev/T/#u
> https://lore.kernel.org/stable/20260506012115.286204-1-jiayuan.chen@linux.dev/T/#u

I tried the patch on top of 6.1.170 and this resolves the issue. I
added the Tested-by to your patch submission.

Thank you.

Regards,
Salvatore
