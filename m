Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB9329C71
	for <regressions@lists.linux.dev>; Wed, 15 Jul 2026 22:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784152980; cv=none; b=OIkqJHG8rMwd+dCM01fTHI+rwZdxJ5Vb/kvWeVIyz2/9aeKzwMbpYuiRuFr34jsV/S+y2k8Yl6nTHUmy2n0vUBVl2igATMIt6KdqEcknAyrTXYEokyaBpwfKZSjhuQIL5TRP1KKZZAIOIhG7jRLuqI9WdI3vT4wbD9Y/aKTVjqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784152980; c=relaxed/simple;
	bh=cw5QF35qg6YhL2y+sMOlUt0eovqOLHhwz4UuHZC3bPA=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=LDhWpyP4lk+wPy5kitjG6C6W3ntNnk9wqCuCISZnflr7VlJ5YpSATxfAPJEmmCNbRHOBXVUHLc8Tra7zipRZ9C2ivRcrvkw3RZKAA6OcW0/lfLAHAb39KYpQ/qH5Kp7ca9CjDUtn+ePT0Xi+ZbSAosuLs1AX8n14BmVSK2LuP9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcat.cc; spf=pass smtp.mailfrom=kcat.cc; arc=none smtp.client-ip=64.142.111.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcat.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcat.cc
Received: from 192-184-190-95.static.sonic.net (192-184-190-95.static.sonic.net [192.184.190.95])
	(authenticated bits=0)
	by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 66FLnTvH007667;
	Wed, 15 Jul 2026 14:49:29 -0700
From: Forest <forestix@kcat.cc>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Forest <forestix@gaga.casa>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after running adb
Date: Wed, 15 Jul 2026 14:49:29 -0700
Message-ID: <hlvf5ldeeqn6muboqnba6q09ak0oo0aadj@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net> <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com> <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net> <f8ee4a2f-6b95-4f91-9ffc-b7df45464d46@linux.intel.com> <fod4jk1tp199qsvqqlspl45nf29i5k3c0i@sonic.net> <7a6dfc17-12cc-4972-88d8-acf86e4fca45@linux.intel.com>
In-Reply-To: <7a6dfc17-12cc-4972-88d8-acf86e4fca45@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVb2wOlQegGF/lDhTtkPkUgYyjBWiGY3anw5kVlC0sdSgfgSIW8D0sRkL/v8S69wxmMxG3AkY/4+IRbl3ME9RGCu
X-Sonic-ID: C;Hp45DpeA8RG7laLmcIitdA== M;XrpBDpeA8RG7laLmcIitdA==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

For the record, I (the reporter) have a new email address.

It was: forestix@gaga.casa
It is now: forestix@kcat.cc


On Fri, 5 Dec 2025 16:57:45 +0200, Mathias Nyman wrote:

>> A screen photo once again shows newer timestamps than the file. I did not
>> read every line in the photo to compare it with the log file, but the last
>> dozen lines look the same. I suppose I can send you the photo if you like.
>> 
>
>Yes please, small differences, ordering, and timing matter in this case

Mathias, I sent the screen shot directly to your intel email address
back in December. (I sent it only to you, since I'm not sure binaries
would be welcome on the list.)

Did you get a chance to look it over?

Forest
