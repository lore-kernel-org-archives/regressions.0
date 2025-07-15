Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154012D63ED
	for <regressions@lists.linux.dev>; Tue, 15 Jul 2025 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572623; cv=none; b=HGL6/TUqRUHQ2GqVdriGZj/Lf65QqPkJejlntwGPx1A6b/R0k2AX2/iWtDv+zgsTA7P+WnNgkasyI9dB5CJmoVPLdrNQvhOSflzOrEgFQ/2Khg5nYJeF0OiCyEGHkFiUpl1OX1G+UbcHKdQ3OdyyLEqrtZxXoBT7ueRH0bNcjlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572623; c=relaxed/simple;
	bh=izVGqEo59aQaJ/J3dKmYZUnzyzOQr38MLYsTGyUr5V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TCIU0eNpcLUdNuPUF2o2EU/L0nYSq7b2yOvFH5KCG3ffwUGLCM+4JCw7hpRC9pZEt0KNcW1VF2rUl8UwK6EnkKgkpWa8IivApsNcgUBJsPsw2NnKPhr1sBul3ElJa9Sj3zGoiqKtMfEUpjUwIf7R328lxE6BqkhWQfM4k/HH1V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/scXD9g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/scXD9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752572621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wHMd57pfXhcnKNyhyGblHFv+xYATdiBZA7QtN8Jk8ZM=;
	b=i/scXD9gn3sFhebCDM0YGxdKzuxmxltdxJTn573pWYkavICZk2EkJb+U4av+2O1plOj1/B
	veZashgaAeBIlJaIEjJ3rtfyZhkqzEXlOfo7rd+pu5bcLlNgOtJUMpwtQs+pODR4T+Kua7
	eLf8mg7Br6sEn+Iqq0bEhzOD3v9OLLg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-rhoEO-W4Mr6ybORNM18mvQ-1; Tue, 15 Jul 2025 05:43:37 -0400
X-MC-Unique: rhoEO-W4Mr6ybORNM18mvQ-1
X-Mimecast-MFC-AGG-ID: rhoEO-W4Mr6ybORNM18mvQ_1752572616
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so27655685e9.0
        for <regressions@lists.linux.dev>; Tue, 15 Jul 2025 02:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572616; x=1753177416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHMd57pfXhcnKNyhyGblHFv+xYATdiBZA7QtN8Jk8ZM=;
        b=wskJKfWSXLKnJTTdHevviVZMt57OhIcC21jFQt4fi1Ph9AXrBIegWzQ+V5DyY4bdzF
         eVhHAqBR+zAOrL2eQyYc0ca5KSjUdPuYSwOyZ8XT4A5AKgR4u08Jjagz2nYiGOqUYyLW
         t6tiy2j9ib6pvkPqn1gQTf74paXxLTm3R4aCZV18e3HPdMDkqtRlUG/x0hMSqG6yUKNh
         zVmQh8ndC2Tc3jURSCeexaHx/BWbZJ/Qm9vE14FXJoozNst17HmT663PXYd3J1R386Jl
         srsSH3gxP4HBHWD4RbIsx0mPvZG9Cec6YLQFaCyx3JVWcr8SS7bjROEZ3dEISU/ErbDw
         FQdA==
X-Forwarded-Encrypted: i=1; AJvYcCV7wFzgo8bFlNwfUQKCIf5momYcUR5Gi2cGuTn67YVQnV0EvLXxZO1uuBCoY4mJBxJyR7Zd8br+nkTlsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwW5rF9zc4PnrucWcAG4wpYZc9HmsBwK9796QvwG/9xhnpEg8+k
	f1HHABV9pmsKrtUUuxtH63ZmR6Aa7OkvrJpcxZhY+kcowLSXSPNkZQeinNqSZiOfacDQeR5h5Jk
	8MUhbxO7X802Yrg/RRSpSmJ0KHJ/I7cMvXSKTlPua/g44Ijv0JKQvq1V0eTOdWCME
X-Gm-Gg: ASbGncs4m/PPX4kkr/JtlFkUH+ExJFPWmFMGS9Qbc+lZfr1+UKTYfOcfG92B7Qv81kN
	1cTUly1IjT/CTx+j0NzPZHOpnD8Ysc2OCVtvPZAkfJC+jhpDgaISSzQjRWhVDJf7EhGn/tvTkYV
	hRb4XUZ0F9+aHMRV6x5RuQXZUZw0tS27soSXtBTd3R3jD9k+JFo1uKSXKvHJinkDow9hs9cthir
	pvbuSgC+YRJrRID7sck1GU6IcupMhurVhHBXt1qOdsuSog7VZWcPodt6QGH7bruIumg7MDe7XV4
	fPWTBUcfyWryAh8TdeEPt8XQUkQ=
X-Received: by 2002:a05:600c:821b:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-4555f89f507mr187240835e9.10.1752572616448;
        Tue, 15 Jul 2025 02:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN73ANiZ06ERUP471KmOgFnUFAPyMUPH/okS1ibcPZuQjxLvuh1FG3xOFXv+UfdNO1P57u2Q==
X-Received: by 2002:a05:600c:821b:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-4555f89f507mr187240285e9.10.1752572615932;
        Tue, 15 Jul 2025 02:43:35 -0700 (PDT)
Received: from debian ([2001:4649:f075:0:a45e:6b9:73fc:f9aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1833sm14279030f8f.8.2025.07.15.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 02:43:34 -0700 (PDT)
Date: Tue, 15 Jul 2025 11:43:30 +0200
From: Guillaume Nault <gnault@redhat.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Stefano Brivio <sbrivio@redhat.com>, Aaron Conole <aconole@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Charles Bordet <rough.rock3059@datachamp.fr>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org, 1108860@bugs.debian.org
Subject: Re: [regression] Wireguard fragmentation fails with VXLAN since
 8930424777e4 ("tunnels: Accept PACKET_HOST skb_tunnel_check_pmtu().")
 causing network timeouts
Message-ID: <aHYiwvElalXstQVa@debian>
References: <aHVhQLPJIhq-SYPM@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aHVhQLPJIhq-SYPM@eldamar.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zikZ84QC0jcj49Rd5N57OPeEzA4e5qmybqTlCvCX_qY_1752572616
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 14, 2025 at 09:57:52PM +0200, Salvatore Bonaccorso wrote:
> Hi,
> 
> Charles Bordet reported the following issue (full context in
> https://bugs.debian.org/1108860)
> 
> > Dear Maintainer,
> > 
> > What led up to the situation?
> > We run a production environment using Debian 12 VMs, with a network
> > topology involving VXLAN tunnels encapsulated inside Wireguard
> > interfaces. This setup has worked reliably for over a year, with MTU set
> > to 1500 on all interfaces except the Wireguard interface (set to 1420).
> > Wireguard kernel fragmentation allowed this configuration to function
> > without issues, even though the effective path MTU is lower than 1500.
> > 
> > What exactly did you do (or not do) that was effective (or ineffective)?
> > We performed a routine system upgrade, updating all packages include the
> > kernel. After the upgrade, we observed severe network issues (timeouts,
> > very slow HTTP/HTTPS, and apt update failures) on all VMs behind the
> > router. SSH and small-packet traffic continued to work.
> > 
> > To diagnose, we:
> > 
> > * Restored a backup (with the previous kernel): the problem disappeared.
> > * Repeated the upgrade, confirming the issue reappeared.
> > * Systematically tested each kernel version from 6.1.124-1 up to
> > 6.1.140-1. The problem first appears with kernel 6.1.135-1; all earlier
> > versions work as expected.
> > * Kernel version from the backports (6.12.32-1) did not resolve the
> > problem.
> > 
> > What was the outcome of this action?
> > 
> > * With kernel 6.1.135-1 or later, network timeouts occur for
> > large-packet protocols (HTTP, apt, etc.), while SSH and small-packet
> > protocols work.
> > * With kernel 6.1.133-1 or earlier, everything works as expected.
> > 
> > What outcome did you expect instead?
> > We expected the network to function as before, with Wireguard handling
> > fragmentation transparently and no application-level timeouts,
> > regardless of the kernel version.
> 
> While triaging the issue we found that the commit 8930424777e4
> ("tunnels: Accept PACKET_HOST in skb_tunnel_check_pmtu()." introduces
> the issue and Charles confirmed that the issue was present as well in
> 6.12.35 and 6.15.4 (other version up could potentially still be
> affected, but we wanted to check it is not a 6.1.y specific
> regression).
> 
> Reverthing the commit fixes Charles' issue.
> 
> Does that ring a bell?

It doesn't ring a bell. Do you have more details on the setup that has
the problem? Or, ideally, a self-contained reproducer?


> Regards,
> Salvatore
> 

