Received: from nov-007-i673.relay.mailchannels.net (nov-007-i673.relay.mailchannels.net [46.232.183.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4AB1CC8B1
	for <regressions@lists.linux.dev>; Thu, 22 Aug 2024 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.232.183.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340670; cv=none; b=fGtS4zNlFmU6NyPCwJX9kwnVisua8N+HEGRhqlPYR7vkdSdvgv96ZajYg0sE0fiaLcn3+rkYbwdJs+ERIFZX24DO/Pw3gARF79IA6PR28JQ0qTtNa2L2dPGJwH3+q3w4/LEHwJjUxtCIVnZBgMSc1IB7FcCGvJoO8u1J8xxFEEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340670; c=relaxed/simple;
	bh=Sgn+JlE+y02mD/2NB0fDhHhN/s8R73WdXbqdvYgKqsg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ChWn51nLIVenlchCXkYJ0pDTS0D7oj0YatwgPyuUmGfbM98SKiEkjSQcTjmb2JkykJvhQTkR0pgawOo/J2YjQIvjR/BRMC7z8VnClJigFi3QeQ2y5xFXGvF2++Nc4vuZGQwdznUjRRBhQGjg5QF+w/08JebFz1jednTybje6ukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitron.ch; spf=pass smtp.mailfrom=bitron.ch; dkim=pass (2048-bit key) header.d=bitron.ch header.i=@bitron.ch header.b=folE29DH; arc=none smtp.client-ip=46.232.183.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitron.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitron.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitron.ch header.i=@bitron.ch header.b="folE29DH"
X-Sender-Id: novatrend|x-authuser|juerg@bitron.ch
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D3470E0001A;
	Thu, 22 Aug 2024 14:14:52 +0000 (UTC)
X-Sender-Id: novatrend|x-authuser|juerg@bitron.ch
X-MC-Relay: Neutral
X-MailChannels-SenderId: novatrend|x-authuser|juerg@bitron.ch
X-MailChannels-Auth-Id: novatrend
X-Trail-Thread: 663174d76a6c0544_1724336092710_2543201654
X-MC-Loop-Signature: 1724336092710:2881423526
X-MC-Ingress-Time: 1724336092710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitron.ch;
	s=default; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Sgn+JlE+y02mD/2NB0fDhHhN/s8R73WdXbqdvYgKqsg=; b=folE29DHU4vK6Tvik02lZfZqUu
	euDED2ozeUmrJZvzbipeKSdD3gkUJuJYVZMUEPPEMUwmEh6UceRQ8kUzdMFVW0Le8LFNxjF9jMClr
	TqLn5x5O6IKv0EtauGZntSsLY68F08sPZnApnwT1UWpuOCaRo1GY7hEU6zPg0XBCHgYE0zcSn9Hq3
	ud14ETW2kQ5o+wPmi2eICDRmqDbv1EEESvRgOezHGAmYCDlNHtONG3RMFoHOwHgMDDMfkKzxrsM3H
	01iiIOHymop+j/ivjgmS+3ztMSW3s85kirIU1j9nbxss5tYZR32nAxi93TJiF/PAxps542YpIFQ2/
	cADYBicw==;
Message-ID: <dbe300f06380729372c42c0cb198c721d9d9b083.camel@bitron.ch>
Subject: Re: [REGRESSION] fuse: copy_file_range() fails with EIO
From: =?ISO-8859-1?Q?J=FCrg?= Billeter <j@bitron.ch>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev
Date: Thu, 22 Aug 2024 16:14:45 +0200
In-Reply-To: <CAJfpegtNF4yCH_00xzBB1OnPBHk+EP0ojxDPp=qCFVKC=c14ag@mail.gmail.com>
References: <792a3f54b1d528c2b056ae3c4ebaefe46bca8ef9.camel@bitron.ch>
	 <ZrY97Pq9xM-fFhU2@casper.infradead.org>
	 <5b54cb7e5bfdd5439c3a431d4f86ad20c9b22e76.camel@bitron.ch>
	 <ZreDcghI8t_1iXzQ@casper.infradead.org>
	 <CAJfpegvVc_bZbL1bjcEbEh4+WU=XVS94NMyBPKbcHzAzyxM6_Q@mail.gmail.com>
	 <ea297a16508dbf8ecfa4417cc88eef95b5d697e8.camel@bitron.ch>
	 <CAJfpegsvQLtxk-2zEqa_ZsY5J_sLd0m4XhWXn1nVoLoSs8tjrw@mail.gmail.com>
	 <CAJfpegtNF4yCH_00xzBB1OnPBHk+EP0ojxDPp=qCFVKC=c14ag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-AuthUser: juerg@bitron.ch

On Thu, 2024-08-22 at 15:32 +0200, Miklos Szeredi wrote:
> On Thu, 22 Aug 2024 at 15:14, Miklos Szeredi <miklos@szeredi.hu>
> wrote:
>=20
> > > > What I don't understand is how this results in the -EIO that J=C3=
=BCrg
> > > > reported.
> > >=20
> > > I'm not really familiar with this code but it seems `folio_end_read()=
`
> > > uses xor to update the `PG_uptodate` flag. So if it was already set, =
it
> > > will incorrectly clear the `PG_uptodate` set, which I guess triggers
> > > the issue.
>=20
> Untested patch attached.=C2=A0 Could you please try this?

I can no longer reproduce the issue with this patch. So at least with
regards to my test case, it looks good to me.

Cheers,
J=C3=BCrg
