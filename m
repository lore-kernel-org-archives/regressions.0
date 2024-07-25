Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FBA2D03B
	for <regressions@lists.linux.dev>; Thu, 25 Jul 2024 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721919975; cv=none; b=BXCa7RY6pH7P52aiu0CQEbvdsEPK77O4/4T5npKnbnFHBhCPIUt8LdNbBDSQVYPvDPVycRcD+yAT8jCqm3GVp5/V7ByQAHSL7WPCaYzuNMTOVzkpo0OqtI8GhO7FA9fwKbIxJYVms1EM1XUMstXSGS2WwkMXLle8WlzQs5olL7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721919975; c=relaxed/simple;
	bh=klhcupiSnzZjEwy2ORCn/f5y48gvFionPVTR6qinpKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQWN1a7cE7bxBhPY3NHqIYTBn/eSLh4jxkYPhKmzjeUf14G7xxaOnV/Ta74bvBQHLWSqfQXY1OAka6h68ohQ3yGGUmLMe2sr89gzK4J0fviOg2uVwP+jRWSO0W2bwCscFdyTY2Gfkx+kgJ4t/K+xs8lkt+mhfzANj7N3e8gy+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=DHgZMX5A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lstSyifR; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="DHgZMX5A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lstSyifR"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 15B741140153;
	Thu, 25 Jul 2024 11:06:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 25 Jul 2024 11:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1721919970; x=
	1722006370; bh=t+z2WwcSe7QLeZynJcabPdsfa6tgNxxAeuqOFR0xAaE=; b=D
	HgZMX5A0fPflfC4LuugsYNlkK3KHsQPEkRmCVS+M9N2EGXOP1Z5X0Ezx9qwJ0H3r
	wgWxJ6xS2AXBdQemZ3hoQVajDgWrwwvCKziohNuEpY044hornDSrPHJ5qVpaOacH
	BMXMlljJDuOKTY3PDoazXqmS6p/TukGGfD3rt+l5Pt19MLJ+BmW2WVMfIGoxcF8z
	Owan2t/I3IMbrR4639nmfHemDX4nOTLvOP/p44rS4DGFQ+1dPKRgWr/YT2eIJxyu
	AaigTMFp4hQNKXkgUfbtVNMmfWfbFAsy/n2MAXN19gIG6zqENQepB/myoGZ8s0hc
	n3n3rqSIgYc50fkdPvaEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721919970; x=1722006370; bh=t+z2WwcSe7QLeZynJcabPdsfa6tg
	NxxAeuqOFR0xAaE=; b=lstSyifRFbckCbX40djberdQyV+adJn3okg68JuzBoLw
	5aQULdMB9cVN/EpJks1lDOg56R7IzCZNoMfidpRQ49KLJDH4VoPIISAfbwK6vFnd
	ErNf7Fyi6KYKqhBI192tNX9QTc/ay99Kk594f/aErUCBrBsXWR+t1sR2A3G9fyaK
	6SQk1WcA/r2jpORFKQn8vdJ3zwiLczMUnFO1kddGmYl5VNsBGvoshhCxHIWIuodp
	e39Mn5Fvu5PASB/IFhqk/0W2BwO7HwTbmCOteQEJQNuFTqOaCI4WMXo3qjqXU45x
	G0mKEtG3vWawOJ/T2aF9PbT6I6vgM4bd29BF3skx5g==
X-ME-Sender: <xms:4WmiZsYNX-txLxLJG22wbcRa2EHygxsei5IoBEcTUrtcoGFEdLG2iA>
    <xme:4WmiZnbdVkxsrJrYyeLTX6XBoBSbl-6hCBBqaMWGdqwESbjccvDpoXckT91woyF_9
    fLI0nAAzW3EWFIZxJ8>
X-ME-Received: <xmr:4WmiZm-nHADuGLwNvWDA_0JdYecwjW45rw0I3VLuoimoanzfulEXmtpxzAbeF1OHtIymrkMaxOFZ6k6pqQAIlzA07XIcwXj8M9Gy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieefgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpedtheehieffjeffffekteehhfejgeduuedvhfevgeff
    teejfeevuefgueefuedvudenucffohhmrghinhephhgvrgguvghrpghlvghnghhthhdrih
    htnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdq
    thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:4WmiZmpw2KugmtnQlBhmmFjTmgiKXKbUBgMhbl9Bd3OOpO5PA4gROw>
    <xmx:4WmiZnrdImoZiEWjd5BTraJ-3KIad0vwJrPNOW4wcQNyTkrFiBsVTw>
    <xmx:4WmiZkSFMv1WeFQWv_1WCfwaqO_eD71A1fiwluPRHjhST0YAMQRHfw>
    <xmx:4WmiZnpni3dR2vaq4k4_vj8wWs8oOkqUWjswbbgNLLl8VzCzIKG6Qw>
    <xmx:4mmiZq1_8h-qFL9Tq2y-fusb2CNBzMVDLNO1WwIcuT0dRkrmaumnwfNr>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jul 2024 11:06:06 -0400 (EDT)
Date: Fri, 26 Jul 2024 00:06:03 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Takashi Iwai <tiwai@suse.de>, "edmund.raile" <edmund.raile@proton.me>,
	alsa-devel@alsa-project.org, stable@vger.kernel.org,
	regressions@lists.linux.dev, gustavoars@kernel.org,
	clemens@ladisch.de, linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
Message-ID: <20240725150603.GA109922@workstation.local>
Mail-Followup-To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Takashi Iwai <tiwai@suse.de>,
	"edmund.raile" <edmund.raile@proton.me>,
	alsa-devel@alsa-project.org, stable@vger.kernel.org,
	regressions@lists.linux.dev, gustavoars@kernel.org,
	clemens@ladisch.de, linux-sound@vger.kernel.org
References: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
 <87r0bhipr7.wl-tiwai@suse.de>
 <906edca8-a357-4fc2-913d-be447a86963c@embeddedor.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <906edca8-a357-4fc2-913d-be447a86963c@embeddedor.com>

On Thu, Jul 25, 2024 at 08:08:14AM -0600, Gustavo A. R. Silva wrote:
> Hi!
> 
> On 25/07/24 07:07, Takashi Iwai wrote:
> > On Thu, 25 Jul 2024 00:24:29 +0200,
> > edmund.raile wrote:
> > > 
> > > Bisection revealed that the bitcrushing distortion with RME FireFace 800
> > > was caused by 1d717123bb1a7555
> > > ("ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning").
> > > 
> > > Reverting this commit yields restoration of clear audio output.
> > > I will send in a patch reverting this commit for now, soonTM.
> > > 
> > > #regzbot introduced: 1d717123bb1a7555
> > 
> > While it's OK to have a quick revert, it'd be worth to investigate
> > further what broke there; the change is rather trivial, so it might be
> > something in the macro expansion or a use of flex array stuff.
> > 
> 
> I wonder is there is any log that I can take a look at. That'd be really
> helpful.

The original designated initializer fills all of fields with 0.

The new designated initializer assigns CIP_HEADER_QUADLETS (=2) to
struct fw_iso_packet.header_length. It is wrong value in the case of
CIP_NO_HEADER. Additionally it is wrong value in another case since the
value of the field should be byte unit.

I'll post a patch soon.


Regards

Takashi Sakamoto
