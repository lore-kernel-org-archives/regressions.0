Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5D1D27A9;
	Tue,  5 Nov 2024 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804113; cv=none; b=U/yi0/IqCjyFSODvCzS9DUNSywGhnQyY0FL87G+7Oq7V/LOi38C+ItFezQKJKWz3AzDFfPOOzEDGA0Q8GQs1I2PoZ8cFzMT/AUPcpez63fq3112iqY9GK3xOmkd6tXUE+X6PpniOhNrEg6wC2o3N7sGIMeC5YsyPiL4qSk/aSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804113; c=relaxed/simple;
	bh=8lGTkeTf357shYpjRRS1920JphW/vASIkQHYJv5X4bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKZGoMIbScoPzoddRotmmwKcNZrKCI39nbWc5c24gmXnF2MK06z2LUTVQ/QPan7NnTyxaFJwrcMRNVJK0MAhkyFdVw/OSO4ZIOXYMotL+Kff3rqKMDdz/EugTcAOCa+P61qxtdRAzpZv02OBBApCTwnbcWvPg5mfgBYt9O+OSJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kueiznOZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kueiznOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B63C4CECF;
	Tue,  5 Nov 2024 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730804112;
	bh=8lGTkeTf357shYpjRRS1920JphW/vASIkQHYJv5X4bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kueiznOZOuvRXUvaJQgoV9tVVnq6uNCDRSAWnuVZBOGbcOaZ/fkqd61/GObqr1FEN
	 EyWEVtYY/SOYZJfkTaQ+JF6qJ2FeHbBVUEUI23YHRg8M71aY1CMgLVMM+Ucq/8ULEr
	 nipUG5S5wSaLsR/ko8lNdG7mKaGEbRJui3si1YwA=
Date: Tue, 5 Nov 2024 11:54:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>,
	Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
Subject: Re: [PATCH v2] thunderbolt: Fix connection issue with Pluggable
 UD-4VPD dock
Message-ID: <2024110542-moaning-zap-7ac2@gregkh>
References: <20241105103157.526823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105103157.526823-1-mika.westerberg@linux.intel.com>

On Tue, Nov 05, 2024 at 12:31:57PM +0200, Mika Westerberg wrote:
> Rick reported that his Pluggable USB4 dock does not work anymore after
> upgrading to v6.10 kernel.
> 
> It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
> access polling delay") makes the device router enumeration happen later
> than what might be expected by the dock (although there is no such limit
> in the USB4 spec) which probably makes it assume there is something
> wrong with the high-speed link and reset it. After the link is reset the
> same issue happens again and again.
> 
> For this reason lower the sideband access delay from 5ms to 1ms. This
> seems to work fine according to Rick's testing.
> 
> Reported-by: Rick Lahaye <rick@581238.xyz>
> Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
> Tested-by: Rick Lahaye <rick@581238.xyz>
> Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
