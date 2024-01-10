Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CA48785
	for <regressions@lists.linux.dev>; Wed, 10 Jan 2024 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wxix72ij"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5587af6ae5cso280949a12.3
        for <regressions@lists.linux.dev>; Wed, 10 Jan 2024 08:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704903630; x=1705508430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiGQ3HzqRw9BhGq2ukZfu7U4Ux6Gx0fec0Z0CywCxtU=;
        b=Wxix72ijz9HHx59P/CamFM4e/136ehhNzqAHLBVPMup6QkuOZTijvUopW+8AqQp8FP
         QS+65HKY1qss747IzvjtDizj7wBZ2wtcCvBnBIiEfJXK2WDguHsh1di6QejA38wLS4HY
         tOUW8f02xZb0jgNqYm5e3w5p+IFrPn+C7BkJwcUJK65BQ/Hp0FkElPKzlWdj67zw0H9k
         t9mi/y1jEqg1RwAKADY55YYBVJA4/3r8jz1a7CjTaSdVmJ3A8X8o5FrhhhWh5a2F/DKl
         zxPxg4H/BnalhjS1GpIEr2MLcU5HIriwy6oqZPfCSZDsMOpvqKkh8aPEAW8uDJficL8l
         zMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704903630; x=1705508430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiGQ3HzqRw9BhGq2ukZfu7U4Ux6Gx0fec0Z0CywCxtU=;
        b=oKP9NWgO4yL9bG3tacDklHzkfvHGwKyIr9wXJCIPE7NeYe1wzUDnzA6Gc/u/4f9YuM
         dVuP/7hpx14Kkz3FxTRtTE6OF+j8Jzihif/xYxw2jvwO3DgvZYqtHv1XTOTHuy5UxB/t
         S+YaEAWKlOu+nUrOOtvUPZo84ZmjFaf4nglsF29vceHAgA2w3hjUpdTUPKY+uCd41zS3
         Sq97/DNSUn+/yNKfq+3bHBpf2pohzXnZKl7B85pCi8VmmNJXBH8VdlVbQ23PGd8v8rCk
         1liDMymTyJug4reIBfRriPvoYRX+PgUmQIpD2aCoVK6YwAFttW8MXbKLP2ju/ySjKIQe
         +VmQ==
X-Gm-Message-State: AOJu0Yx/vnU3SvoZUi2pHs6rX3eDLHzLBivAeAngmp1NzQRZQOU3ElXk
	3qxNXD0PN1N4Q9T80g5/Pa4=
X-Google-Smtp-Source: AGHT+IHIX8ycHGd0EqT2+MdwAY36uRF5Dgt9eDaeEe5o8UpwwsXB+tUmydMpiBcVjI8SP8rgJa9KIw==
X-Received: by 2002:a50:9e87:0:b0:557:ba20:839 with SMTP id a7-20020a509e87000000b00557ba200839mr643069edf.41.1704903630339;
        Wed, 10 Jan 2024 08:20:30 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id ig15-20020a056402458f00b0055871ed18f9sm390720edb.89.2024.01.10.08.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 08:20:28 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 0525EBE2DE0; Wed, 10 Jan 2024 17:20:28 +0100 (CET)
Date: Wed, 10 Jan 2024 17:20:27 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Steve French <stfrench@microsoft.com>
Cc: "Jitindar Singh, Suraj" <surajjs@amazon.com>,
	"rohiths.msft@gmail.com" <rohiths.msft@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"stfrench@microsoft.com" <stfrench@microsoft.com>,
	"pc@manguebit.com" <pc@manguebit.com>,
	"jlayton@kernel.org" <jlayton@kernel.org>,
	"nspmangalore@gmail.com" <nspmangalore@gmail.com>,
	"willy@infradead.org" <willy@infradead.org>,
	"stable-commits@vger.kernel.org" <stable-commits@vger.kernel.org>,
	stable@vger.kernel.org, linux-cifs@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [Regression 6.1.y] From "cifs: Fix flushing, invalidation and
 file size with copy_file_range()"
Message-ID: <ZZ7Dy69ZJCEyKhhS@eldamar.lan>
References: <2023121124-trifle-uncharted-2622@gregkh>
 <a76b370f93cb928c049b94e1fde0d2da506dfcb2.camel@amazon.com>
 <ZZhrpNJ3zxMR8wcU@eldamar.lan>
 <8e59220d-b0f3-4dae-afc3-36acfa6873e4@leemhuis.info>
 <ZZk6qA54A-KfzmSz@eldamar.lan>
 <13a70cc5-78fc-49a4-8d78-41e5479e3023@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a70cc5-78fc-49a4-8d78-41e5479e3023@leemhuis.info>

Hi

Sorry if this is to prematurely to ask already again.

On Sat, Jan 06, 2024 at 01:02:16PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 06.01.24 12:34, Salvatore Bonaccorso wrote:
> > On Sat, Jan 06, 2024 at 11:40:58AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>
> >> Does this problem also happen in mainline, e.g. with 6.7-rc8?
> > 
> > Thanks a lot for replying back. So far I can tell, the regression is
> > in 6.1.y only 
> 
> Ahh, good to know, thx!
> 
> > For this reason I added to regzbot only "regzbot ^introduced
> > 18b02e4343e8f5be6a2f44c7ad9899b385a92730" which is the commit in
> > v6.1.68.
> 
> Which was the totally right thing to do, thx. Guess I sooner or later
> will add something like "#regzbot tag notinmainline" to avoid the
> ambiguity we just cleared up, but maybe that's overkill.

Do we have already a picture on the best move forward? Should the
patch and the what depends on it be reverted or was someone already
able to isolate where the problem comes from specifically for the
6.1.y series? 

Regards,
Salvatore
