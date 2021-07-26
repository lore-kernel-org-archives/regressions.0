Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FBC70
	for <regressions@lists.linux.dev>; Mon, 26 Jul 2021 07:29:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EB1760E0C;
	Mon, 26 Jul 2021 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627284573;
	bh=kusX5fLuGdb9BFCiLE2HBjxax5OQ+uPBg5SKTqn7/Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OztN+U+DNu2vDKvfgBGn3PNyT0uI9SuaesCtmGVNZVD/ZSDJfKZfFS4cDWNIPfIBX
	 ZN3eFcRqY2cLj+z7qLFEvn1N5so9n7tWRG58jnq9yh6gWvg2GnpSvXqEftnZPjEpTe
	 gFwvU0qnxKqXekb50V3gt/tP4SeRwBlz3+wlIJqw=
Date: Mon, 26 Jul 2021 09:13:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?QWxlcGjQv8+E?= 1 <alephpt1@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Crash Shell, Terminal, or TTY
Message-ID: <YP5gmWkTAGxH/e4/@kroah.com>
References: <CAHUEyWUFixkBRgRXYGxE5rX9ekh98+UEbhHM-PsYP7+Ok1PtQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUEyWUFixkBRgRXYGxE5rX9ekh98+UEbhHM-PsYP7+Ok1PtQw@mail.gmail.com>

On Mon, Jul 26, 2021 at 02:04:17AM -0500, Alephпτ 1 wrote:
> I tried sending this as text with the commands in the email but it rejected
> it because of the code.
> 
> Hopefully this screenshot works

screenshots can not be seen with text email readers :(
