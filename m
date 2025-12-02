Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB2028C00C
	for <regressions@lists.linux.dev>; Tue,  2 Dec 2025 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764701860; cv=none; b=MYmfBMyYFMbQFKC9xN8iDagjgiC7y27TnffufYeNJfQPcFbbt2F8yD1QmcyY9zTMOOVJzLevDzON4cgQ2JsHetClKliImJEhrQX3VoXmz7Ne9GpYdxI2mi7eW+CfYv8AgCF3idtw+AFyN7kWA0yVLJ2u/5a0lz+2mH3H4nKU0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764701860; c=relaxed/simple;
	bh=axbabiHu+qrZLDRpfBChHFwcLbb45376mHfN7OucHgc=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=DQAuHNctQnxhM7cdU9pHJL6jbmyU/4QzlIoCycy+UbCt22G+GIxd7AUOp+Nz+48w+K4IDfQDCMWkfpLaO/Xt8DQQnCjS8s84eyCgd+0dcHPWpcB926R35LHHqC3LQCInQ0Wr8/f39muZIaQtDusxbU9Ki9oRylVQ/lOcVfsRzn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa; spf=pass smtp.mailfrom=gaga.casa; arc=none smtp.client-ip=64.142.111.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaga.casa
Received: from 192-184-191-52.static.sonic.net (192-184-191-52.static.sonic.net [192.184.191.52])
	(authenticated bits=0)
	by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 5B2IiHiw008256;
	Tue, 2 Dec 2025 10:44:17 -0800
From: Forest <forestix@gaga.casa>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after running adb
Date: Tue, 02 Dec 2025 10:44:17 -0800
Message-ID: <7gcuiktbbd7vharjdl7gbpjqgk6dd0kibb@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net> <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com> <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net>
In-Reply-To: <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVYeTWDJJY0Ur0RZ2Bc6gHYPS91OkMnO9FAVlKEiCiWOjT2uDPjnHigGCPtxmhCW8uKbaO32ltgDzVZvdcmWy2x4
X-Sonic-ID: C;kIxh6K7P8BGMPbo7kIO7Ng== M;nGtx6K7P8BGMPbo7kIO7Ng==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

On Thu, 20 Nov 2025 14:04:45 -0800, Forest wrote:

>On Tue, 18 Nov 2025 11:21:18 +0200, Mathias Nyman wrote:
>
>>If the bisected patch is the issue then disabling runtime suspend could help.
>>For all usb* roothubs:
>>
>>echo on > /sys/bus/usb/devices/usb*/power/control
>>
>>Does it affect anything?
>
>Yes. After setting all of those to 'on', I have been unable to
>reproduce the freeze. Tested for nearly 12 hours so far, so I think
>it does avoid the problem. (I'll do some more testing and report
>back if that changes.)

I've now tested this workaround for about 36 hours with no freeze. 
Looks to me like the bisected commit is indeed the source of the bug.
